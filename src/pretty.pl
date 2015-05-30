#!/usr/bin/perl

use 5.020;
use Glib;
use open IN => ':utf8', OUT => ':locale';

my %defaults = (
	Version=>'1.0',
	Type=>'Application',
	Terminal=>'false',
	StartupNotify=>'false',
	Encoding=>'UTF-8',
);

my @order = (
	'Version',
	'Encoding',
	'Type',
	'Name',
	'GenericName',
	'X-GNOME-FullName',
	'Comment',
	'Icon',
	'TryExec',
	'Exec',
	'MultipleArgs',
	'X-MultipleArgs',

	'ServiceTypes',
	'X-ServiceTypes',
	'X-DBUS-ServiceName',
	'X-DCOP-ServiceName',
	'X-Osso-Service',
	'X-DBUS-ServiceType',
	'X-DCOP-ServiceType',
	'X-Osso-Type',
	'X-DBUS-StartupType',

	'Terminal',
	'TerminalOptions',
	'NoDisplay',
	'Hidden',
	'OnlyShowIn',
	'NotShowIn',
	'Categories',
	'Keywords',
	'X-GNOME-Keywords',
	'X-KDE-Keywords',

	'MimeType',
	'FilePattern',
	'Patterns',
	'Path',
	'URL',

	'StartupNotify',
	'StartupWMClass',
	'XClassHintResName',
	'InitialPreference',
	'DocPath',
	'X-DocPath',
	'X-KDE-DocPath',

	'SingleInstance',
	'X-SingleInstance',
	'X-MB-SingleInstance',

	'X-GIO-NoFuse',
	'X-KDE-Protocols',

	'X-XFCE-Binaries',
	'X-XFCE-Category',
	'X-XFCE-Commands',
	'X-XFCE-CommandsWithParameter',

	'X-KDE-AuthorizeAction',
	'X-KDE-autostart-after',
	'X-KDE-autostart-condition',
	'X-KDE-autostart-phase',
	'X-KDE-BrowserView-Args',
	'X-KDE-FactoryName',
	'X-KDE-HasReadOnlyMode',
	'X-KDE-HasTempFileOption',
	'X-KDE-Library',
	'X-KDE-ModuleType',
	'X-KDE-NativeMimeType',
	'X-KDE-NOTKoDocumentEmbeddable',
	'X-KDE-RootOnly',
	'X-KDE-ServiceTypes',
	'X-KDE-StartupNotify',
	'X-KDE-SubstituteUID',
	'X-KDE-UniqueApplet',
	'X-KDE-Username',

	'X-GNOME-Autostart-Notify',
	'X-GNOME-Autostart-Phase',
	'X-GNOME-Provides',
	'X-GNOME-WMName',

	'X-GNOME-AutoRestart',
	'X-GNOME-Autostart-enabled',
	'X-GNOME-DocPath',
	'X-GNOME-Gettext-Domain',
	'X-GNOME-Username',
	'X-GnomeWMSettingsLibrary',
	'X-GNOME-WMSettingsModule',

	'X-GNOME-Bugzilla-Bugzilla',
	'X-GNOME-Bugzilla-Product',
	'X-GNOME-Bugzilla-Component',
	'X-GNOME-Bugzilla-Version',
	'X-GNOME-Bugzilla-OtherBinaries',
	'X-GNOME-Bugzilla-ExtraInfoScript',
	'X-Desktop-File-Install-Version',

	'X-AppInstall-Package',
	'X-AppInstall-Popcon',
	'X-AppInstall-Section',
	'X-AppInstall-Architectures',
	'X-Arch-Package',

);

my $debug = 0;

my @args = ( @ARGV );
if ($args[0] eq '-d') {
	shift @args;
	$debug = 1;
}

push @args, '/dev/stdin' unless @args;


foreach my $a (@args) {
	my $kf = Glib::KeyFile->new;
	if ($kf->load_from_file($a, ['keep-comments', 'keep-translations'])) {
		print STDERR "# --> FILE: $a\n" if $debug;
		my %keys;
		my @groups = $kf->get_groups;
		my $first = 1;
		foreach my $g (@groups) {
			print "\n" unless $first;
			$first = 0;
			print "[$g]\n";
			if ($g ne 'Desktop Entry') {
				foreach my $k ($kf->get_keys($g)) {
					print "$k=";
					my $v = $kf->get_value($g, $k);
					print "$v\n";
				}
			} else {
				my %keys = ();
				foreach my $k ($kf->get_keys($g)) {
					$keys{$k} = $kf->get_value($g, $k);
				}
				foreach my $k (keys %defaults) {
					unless ($keys{$k}) {
						$keys{$k}=$defaults{$k};
					}
				}
				foreach my $k (@order) {
					unless (exists $keys{$k}) {
						foreach my $s (qw(en en_US en_CA en_GB)) {
							my $l = $k.'['.$s.']';
							if (exists $keys{$l}) {
								$keys{$k} = $keys{$l};
								last;
							}
						}
					}
					if (exists $keys{$k}) {
						print STDERR "# --> PRINTING: key '$k'\n" if $debug;
						print "$k=$keys{$k}\n";
						delete $keys{$k};
					}
					my @choices = ( sort keys %keys );
					for my $c (@choices) {
						if ($c=~/^$k[[]/) {
							print STDERR "# --> PRINTING: key '$c'\n" if $debug;
							print "$c=$keys{$c}\n";
							delete $keys{$c};
						}
					}
				}
				my $actions;
				if (exists $keys{Actions}) {
					$actions=$keys{Actions};
					delete $keys{Actions};
				}
				foreach my $k (sort keys %keys) {
					print STDERR "# *** WARNING: unknown key $k ***\n" if $debug;
					print "$k=$keys{$k}\n";
				}
				if ($actions) {
					printf "Actions=$actions\n";
				}
			}
		}
	}
}

