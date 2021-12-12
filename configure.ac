
AC_PREREQ([2.69])
AC_INIT([xde-helpers],[1.8],[https://github.com/bbidulock/xde-helpers],[xde-helpers],[https://github.com/bbidulock/xde-helpers/issues])
AC_REVISION([1.8])

# set better defaults
AC_PREFIX_DEFAULT([/usr])
if test "$prefix" = /usr -o "$prefix" = NONE; then
	test "$sysconfdir" = '${prefix}/etc' && sysconfdir=/etc
	test "$sharedstatedir" = '${prefix}/com' && sharedstatedir=/var
	test "$localstatedir" = '${prefix}/var' && localstatedir=/var
fi

AC_CONFIG_SRCDIR([configure.ac])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_AUX_DIR([scripts])

DATE='2021-12-12'
AC_SUBST([DATE])

MDOCDATE='December 12, 2021'
AC_SUBST([MDOCDATE])

BRANCH='1.8'
AC_SUBST([BRANCH])

# Initialize Automake
AM_INIT_AUTOMAKE([gnits 1.16 dist-lzip no-dist-gzip std-options -Wall color-tests silent-rules tar-pax])
AM_MAINTAINER_MODE
AM_SILENT_RULES([yes])

# Checks for programs.
AC_PROG_SED
AC_PROG_AWK
AC_PROG_INSTALL
AC_PROG_LN_S
AC_PROG_MAKE_SET
AC_PROG_MKDIR_P

AC_ARG_VAR([MARKDOWN],[markdown command. @<:@default=markdown@:>@])
AC_CHECK_PROGS([MARKDOWN],[markdown],[${am_missing_run}markdown],[$PATH])

AC_ARG_VAR([ASCIIDOC],[asciidoc command. @<:@default=asciidoctor@:>@])
AC_CHECK_PROGS([ASCIIDOC],[asciidoc asciidoctor],[${am_missing_run}asciidoc],[$PATH])

AC_ARG_VAR([ASCIIDOC_BACKEND],[asciidoc backend @<:@default=NONE@:>@])
if test -z "$ASCIIDOC_BACKEND"; then
	case "$ASCIIDOC" in
		asciidoc) ASCIIDOC_BACKEND="--backend=html4" ;;
		asciidoctor) ASCIIDOC_BACKEND="--backend=html5" ;;
		*) AC_MSG_WARN([ASCIIDOC $ASCIIDOC is not supported.]) ;;
	esac
fi

AC_ARG_VAR([ASCIIMAN],[asciidoc to manpage converter. @<:@default=a2x@:>@])
AC_CHECK_PROGS([ASCIIMAN],[a2x asciidoctor],[${am_missing_run}a2x],[$PATH])

AC_ARG_VAR([ASCIIMAN_FORMAT],[asciidoc manpage option @<:@default=NONE@:>@])
if test -z "$ASCIIMAN_FORMAT"; then
	case "$ASCIIMAN" in
		a2x) ASCIIMAN_FORMAT="--format=manpage" ;;
		asciidoctor) ASCIIMAN_FORMAT="--backend=manpage" ;;
		*) AC_MSG_WARN([ASCIIMAN $ASCIIMAN is not supported.]) ;;
	esac
fi

AC_ARG_VAR([LINKS],[links command. @<:@default=lynx@:>@])
AC_CHECK_PROGS([LINKS],[lynx links],[${am_missing_run}lynx],[$PATH])
if test "$LINKS" = "links"; then
	LINKS="links -codepage utf-8"
fi

xdedir='$(datadir)/xde'
appldir='$(xdedir)/applications'
dockdir='$(xdedir)/dockapps'
traydir='$(xdedir)/trayicons'
backdir='$(xdedir)/fallback'
sessdir='$(xdedir)/xsessions'
icondir='$(xdedir)/pixmaps'
dirsdir='$(xdedir)/desktop-directories'
xdgdir='$(sysconfdir)/xdg/xde'
autodir='$(xdgdir)/autostart'
menudir='$(xdgdir)/menus'

AC_SUBST([xdedir])
AC_SUBST([appldir])
AC_SUBST([dockdir])
AC_SUBST([traydir])
AC_SUBST([backdir])
AC_SUBST([sessdir])
AC_SUBST([icondir])
AC_SUBST([dirsdir])
AC_SUBST([xdgdir])
AC_SUBST([autodir])
AC_SUBST([menudir])

AC_CONFIG_FILES([Makefile
		 src/Makefile
		 src/applications/Makefile
		 src/xsessions/Makefile
		 src/autostart/Makefile
		 src/menus/Makefile
		 src/desktop-directories/Makefile
		 src/trayicons/Makefile
		 src/dockapps/Makefile
		 src/fallback/Makefile
		 src/icons/Makefile])
AC_OUTPUT

# vim: set ft=config:
