#!/bin/sh

cd sysutils/openzfs/
make clean extract
rm -rf work/ZoF*/*
wget https://github.com/zfsonfreebsd/ZoF/archive/92ddd78b7a30e2766699e110719d6a360394b9f5.zip
unzip 92ddd78b7a30e2766699e110719d6a360394b9f5.zip
cp -Rfa ZoF-92ddd78b7a30e2766699e110719d6a360394b9f5/* work/ZoF*/
make package
make install
