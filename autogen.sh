#!/bin/bash

VERSION=`git describe --always | sed 's|-|.|g;s|[.]g[a-f0-9]*$||'`

sed -r \
    -i configure.ac \
    -e "/^AC_INIT/s|[0-9][0-9]*([.][0-9]*)*|$VERSION|" \
    -e "/^AC_REVISION/s|[0-9][0-9]*([.][0-9]*)*|$VERSION|"

autoreconf -fiv
