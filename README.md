[xde-helpers -- read me first file.  2021-12-12]: #

xde-helpers
===============

Package `xde-helpers-1.8` was released under GPLv3 license
2021-12-12.

This is a set of `.desktop` files intended to assist the XDE (_X Desktop
Environment_).

The source for `xde-helpers` is hosted on [GitHub][1].


Release
-------

This is the `xde-helpers-1.8` package, released 2021-12-12.
This release, and the latest version, can be obtained from [GitHub][1],
using a command such as:

    $> git clone https://github.com/bbidulock/xde-helpers.git

Please see the [RELEASE][3] and [NEWS][4] files for release notes and
history of user visible changes for the current version, and the
[ChangeLog][5] file for a more detailed history of implementation
changes.  The [TODO][6] file lists features not yet implemented and
other outstanding items.

Please see the [INSTALL][8] file for installation instructions.

When working from `git(1)`, please use this file.  An abbreviated
installation procedure that works for most applications appears below.

This release is published under GPLv3.  Please see the license in the
file [COPYING][10].


Quick Start
-----------

The quickest and easiest way to get `xde-helpers` up and
running is to run the following commands:

    $> git clone https://github.com/bbidulock/xde-helpers.git
    $> cd xde-helpers
    $> ./autogen.sh
    $> ./configure
    $> make
    $> make DESTDIR="$pkgdir" install

This will configure, compile and install `xde-helpers` the
quickest.  For those who like to spend the extra 15 seconds reading
`./configure --help`, some compile time options can be turned on and off
before the build.

For general information on GNU's `./configure`, see the file
[INSTALL][8].


Running
-------

Nothing special is required to run the `xde-helpers` package:
XDG desktop tools simply use the installed files.


Issues
------

Report issues on GitHub [here][2].



[1]: https://github.com/bbidulock/xde-helpers
[2]: https://github.com/bbidulock/xde-helpers/issues
[3]: https://github.com/bbidulock/xde-helpers/blob/1.8/RELEASE
[4]: https://github.com/bbidulock/xde-helpers/blob/1.8/NEWS
[5]: https://github.com/bbidulock/xde-helpers/blob/1.8/ChangeLog
[6]: https://github.com/bbidulock/xde-helpers/blob/1.8/TODO
[7]: https://github.com/bbidulock/xde-helpers/blob/1.8/COMPLIANCE
[8]: https://github.com/bbidulock/xde-helpers/blob/1.8/INSTALL
[9]: https://github.com/bbidulock/xde-helpers/blob/1.8/LICENSE
[10]: https://github.com/bbidulock/xde-helpers/blob/1.8/COPYING

[ vim: set ft=markdown sw=4 tw=72 nocin nosi fo+=tcqlorn spell: ]: #
