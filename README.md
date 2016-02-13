
## xde-helpers

Package xde-helpers-1.1.197 was released under GPL license 2016-02-10.

This is a set of .desktop files intended to assist the XDE (X Desktop
Environment).


### Release

This is the `xde-helpers-1.1.197` package, released 2016-02-10.  This release,
and the latest version, can be obtained from the GitHub repository at
https://github.com/bbidulock/xde-helpers, using a command such as:

```bash
git clone https://github.com/bbidulock/xde-helpers.git
```

Please see the [NEWS](NEWS) file for release notes and history of user visible
changes for the current version, and the [ChangeLog](ChangeLog) file for a more
detailed history of implementation changes.  The [TODO](TODO) file lists
features not yet implemented and other outstanding items.

Please see the [INSTALL](INSTALL) file for installation instructions.

When working from `git(1)', please see the [README-git](README-git) file.  An
abbreviated installation procedure that works for most applications
appears below.

This release is published under the GPL license that can be found in
the file [COPYING](COPYING).

### Quick Start:

The quickest and easiest way to get xde-helpers up and running is to run
the following commands:

```bash
git clone https://github.com/bbidulock/xde-helpers.git xde-helpers
cd xde-helpers
./autogen.sh
./configure --prefix=/usr
make V=0
make DESTDIR="$pkgdir" install
```

This will configure, compile and install xde-helpers the quickest.  For
those who would like to spend the extra 15 seconds reading `./configure
--help`, some compile time options can be turned on and off before the
build.

For general information on GNU's `./configure`, see the file [INSTALL](INSTALL).

### Running xde-helpers

Read the manual pages after installation:

    man xde-helpers

### Issues

Report issues to https://github.com/bbidulock/xde-helpers/issues.

