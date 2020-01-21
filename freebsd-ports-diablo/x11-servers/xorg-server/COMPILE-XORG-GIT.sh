#!/bin/sh
echo "####-Upgrade-Xorg-Server-Git-Master-Patch-For-FreeBSD-####"
make clean
make extract
cd xorg-server-1.20.99.1 ; git pull ; cd .. ; rm -rf work/xorg-server-1.20.99.1 
cp -Rfa xorg-server-1.20.99.1 work/xorg-server-1.20.99.1
make patch
cd work/xorg-server-1.20.99.1 
echo "####-Patch Press N Until The End-####" 
gpatch -p1 -i ../../xorg-server-1.20.99.1-FreEBSD-PURE-CLEAN.diff 
cd ../../
make configure ; make ; cd work/xorg-server-1.20.99.1 
echo "####-Press N Until The End Again-####"
gpatch -p1 -i ../../xorg-server-1.20.99.1-FreEBSD-PURE-CLEAN.diff
make distclean
cd ../../
rm work/.configure_done.xorg-server._usr_local
make configure
make package
echo "####-UNLOCK Yes-####"
pkg unlock xorg-server
make deinstall reinstall clean
echo "###-LOCK YES-####"
pkg lock xorg-server




