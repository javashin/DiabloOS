#!/bin/sh
exho "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "###- Trick Port To Upgrade From Gitlab master Tip -###"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
cd x11-drivers/xf86-video-intel/
make clean extract 
git clone https://gitlab.freedesktop.org/xorg/driver/xf86-video-intel.git -b master master-intel-ddx
rm -rf work/xf86-video-intel-e628d22673dfa494230e6f79ceff7d178137c71a-e628d22673dfa494230e6f79ceff7d178137c71a/* 
cp -Rfa master-intel-ddx/* work/xf86-video-intel-e628d22673dfa494230e6f79ceff7d178137c71a-e628d22673dfa494230e6f79ceff7d178137c71a/ 
make deinstall reinstall clean 

echo "###- DONE Restart Xorg-Server -###"
