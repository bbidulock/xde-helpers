
AC_PREREQ(2.69)
AC_INIT([xde-helpers],[1.0],[bugs@openss7.org],[xde-helpers])
AC_REVISION([1.0])

AC_LANG_DEFINES_PROVIDED
AC_CONFIG_SRCDIR([configure.ac])
AC_CONFIG_AUX_DIR([scripts])
AC_CONFIG_MACRO_DIR([m4])
AC_CANONICAL_TARGET

AM_INIT_AUTOMAKE([gnits 1.14 dist-xz no-dist-gzip std-options -Wall color-tests silent-rules tar-pax])
AM_MAINTAINER_MODE

if test :$enable_dependency_tracking != :no ; then
    enable_silent_rules="${enable_silent_rules:-yes}"
fi
AM_SILENT_RULES

AC_USE_SYSTEM_EXTENSIONS
AC_PROG_INSTALL
AM_PROG_INSTALL_STRIP
AC_PROG_LN_S
AC_PROG_MAKE_SET
AC_PROG_MKDIR_P

xdedir='$(datadir)/xde'
appldir='$(xdedir)/applications'
sessdir='$(xdedir)/xsessions'
xdgdir='$(sysconfdir)/xdg/xde'
autodir='$(xdgdir)/autostart'

AC_SUBST([xdedir])
AC_SUBST([appldir])
AC_SUBST([sessdir])
AC_SUBST([xdgdir])
AC_SUBST([autodir])

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
