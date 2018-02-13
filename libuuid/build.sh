#!/bin/bash
set -e
./autogen.sh
mkdir -p build
./configure --prefix=$PWD/build \
            --disable-libblkid \
            --disable-libmount \
            --disable-libsmartcols \
            --disable-libfdisk \
            --disable-mount \
            --disable-losetup \
            --disable-zramctl \
            --disable-fsck \
            --disable-partx \
            --disable-uuidd \
            --disable-mountpoint \
            --disable-fallocate \
            --disable-unshare \
            --disable-nsenter \
            --disable-setpriv \
            --disable-eject \
            --disable-agetty \
            --disable-plymouth_support \
            --disable-cramfs \
            --disable-bfs \
            --disable-minix \
            --disable-fdformat \
            --disable-hwclock \
            --disable-lslogins \
            --disable-wdctl \
            --disable-cal \
            --disable-logger \
            --disable-switch_root \
            --disable-pivot_root \
            --disable-lsmem \
            --disable-chmem \
            --disable-ipcrm \
            --disable-ipcs \
            --disable-rfkill \
            --disable-kill \
            --disable-last \
            --disable-utmpdump \
            --disable-mesg \
            --disable-raw \
            --disable-rename \
            --disable-chfn-chsh-password \
            --disable-chsh-only-listed \
            --disable-login \
            --disable-nologin \
            --disable-sulogin \
            --disable-su \
            --disable-runuser \
            --disable-ul \
            --disable-more \
            --disable-setterm \
            --disable-schedutils \
            --disable-wall \
            --disable-pylibmount \
            --disable-static \
            --without-python \
            --without-systemd \
            --without-systemdsystemunitdir
make
make install
mkdir -p $PREFIX/bin
mkdir -p $PREFIX/lib/pkgconfig
mkdir -p $PREFIX/include/uuid
mkdir -p $PREFIX/share/man/man1
mkdir -p $PREFIX/share/man/man3
cp build/bin/uuidgen $PREFIX/bin/
cp build/lib/libuuid* $PREFIX/lib/
cp build/lib/pkgconfig/uuid.pc $PREFIX/lib/pkgconfig/
cp build/include/uuid/uuid.h $PREFIX/include/uuid/
cp build/share/man/man1/uuidgen.1 $PREFIX/share/man/man1/
cp build/share/man/man3/uuid* $PREFIX/share/man/man3/
