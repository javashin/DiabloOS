#!/bin/sh
echo "##########################################################"
echo "####-Upgrade-Xorg-Server-Git-Master-Patch-For-FreeBSD-####"
echo "##########################################################"
make clean
make extract
tar xvpfJ xorg-server-1.20.99.1-git-for-pull.tar.xz
cd xorg-server-1.20.99.1 ; git pull ; cd .. ; rm -rf work/xorg-server-1.20.99.1
cp -Rfa xorg-server-1.20.99.1 work/xorg-server-1.20.99.1
make patch
cd work/xorg-server-1.20.99.1
echo "#####################################"
echo "####-Patch Press N Until The End-####"
echo "#####################################"
gpatch -p1 -i ../../xorg-server-1.20.99.1-FreEBSD-PURE-CLEAN.diff
cd ../../
make configure ; make ; cd work/xorg-server-1.20.99.1
echo "#####################################"
echo "####-Press N Until The End Again-####"
echo "#####################################"
gpatch -p1 -i ../../xorg-server-1.20.99.1-FreEBSD-PURE-CLEAN.diff
make distclean
cd ../../
rm work/.configure_done.xorg-server._usr_local
make configure
make package
echo "@@@@@@@@@@@@@@@@@@@@"
echo "####-UNLOCK Yes-####"
echo "@@@@@@@@@@@@@@@@@@@@"
pkg unlock xorg-server
make deinstall reinstall clean
echo "@@@@@@@@@@@@@@@@@"
echo "###-LOCK YES-####"
echo "@@@@@@@@@@@@@@@@@"
pkg lock xorg-server




