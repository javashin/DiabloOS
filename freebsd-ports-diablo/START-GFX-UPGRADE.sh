#!/bin/sh

echo "NEEDS TO BE RUN ON DiabloOS/ports-freebsd-diablo Or May Fail"

echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "###########################################################################################"
echo "###- This SCRIPT Tries To Do The BEST TO UPGRADE The Whole Graphic Stack For INTEL GFX -###"
echo "###########################################################################################"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"


echo "@@@@@@@@@@@@@@@@@@@@@@"
echo "###- Install DEPS -###"
echo "@@@@@@@@@@@@@@@@@@@@@@"

pkg install -y py37-mako glslang evdev-proto libevdev xorg-macros font-util uthash

echo "@@@@@@@@@@@@@@@@@@@@@@@@"
echo "###- Upgrade Libdrm -###"
echo "@@@@@@@@@@@@@@@@@@@@@@@@"

cd graphics/libdrm ; make deinstall reinstall clean 

cd ..
cd ..


cd MESA-INTEL

#UnComment For Reinstall
#rm -rf mesa-19.3*

wget https://mesa.freedesktop.org/archive/mesa-19.3.2.tar.xz

tar xvpfJ mesa-19.3.2.tar.xz

cd mesa-19.3.2

gpatch -p1 -i ../NEW-PATCH-FREEBSD.diff
gpatch -p1 -i ../add-disable-tls-support.patch

echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "###- SET binutils ld.bfd for linking -###"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

mv /usr/bin/ld /usr/bin/ld.llvm
ln -s /usr/local/bin/ld.bfd /usr/bin/ld

echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "###- Export Safe Optimizaed Flags And Wno-Error -###"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

export CFLAGS="-march=native -mtune=native -O3 -falign-functions=32 -fstrict-aliasing -fomit-frame-pointer -fno-stack-protector -pipe -Wno-error=unused -Wno-error=unused-variable -Wunused -Wno-all -Wno-error -Wno-extra"

export CXXFLAGS="-march=native -mtune=native -O3 -falign-functions=32 -fstrict-aliasing -fomit-frame-pointer -fno-stack-protector -pipe -Wno-error=unused -Wno-error=unused-variable -Wunused -Wno-all -Wno-error -Wno-extra"

export CPPFLAGS="-march=native -mtune=native -O3 -falign-functions=32 -fstrict-aliasing -fomit-frame-pointer -fno-stack-protector -pipe -Wno-error=unused -Wno-error=unused-variable -Wunused -Wno-all -Wno-error -Wno-extra -I/usr/local/include"

export LDFLAGS="-L/usr/local/include"

echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "###- MESON Configure Ninja Compile -###"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

time meson --buildtype=release --prefix=/usr/local . build -D elf-tls=false -D b_lto=false -D zstd=true -D b_ndebug=true -D platforms=x11,wayland,drm -D dri-drivers=i965 -D gallium-drivers= -D vulkan-drivers=intel -D vulkan-overlay-layer=true -D dri3=true -D egl=true -D llvm=false -D gbm=true -D gles1=false -D gles2=true -D glx=dri -D shared-glapi=true -D valgrind=false -D vulkan=true ; time meson configure build ; time ninja -j3 -v -C build ; time ninja -j3 -v -C build install


#return ld.lld

mv /usr/bin/ld.llvm /usr/bin/ld

echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "###- Upgrade Xorg-Server -###"
echo "###- Configure = Select DEVD and FIXDRM Leave suid -###"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

cd ../../

cd XORG-PORTS-ONLY/x11-servers/xorg-server

sh ./COMPILE-XORG-GIT.sh

echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "###- Upgrade Xorg-Drivers To Match New Xorg-Server Version -###"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"


pkg install -f -y xf86-video-intel 
cd ../../../
sh ./UPGRADE-INTEL-DDX.sh
portsnap auto
cd /usr/ports
pkg install -y xf86-input-synaptics xf86-input-evdev xf86-input-libinput 

echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "###- Select EVDEV On Synaptics Options Dialog  -###"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

portmaster --force-config xf86-input-synaptics xf86-input-mouse xf86-input-keyboard xf86-input-evdev xf86-input-libinput

#echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
#echo "###- Trick The KMS-DRM 4.16 port To Compile 5.0 on 12.1 -Release -###"
#echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

#cd /usr/ports/graphics/drm-fbsd12.0-kmod
#make clean extract
#rm -rf work/kms-drm-f3206bf/*
#git clone https://github.com/FreeBSDDesktop/kms-drm.git -b drm-v5.0-fbsd12.1
#cp -Rfa kms-drm/* work/kms-drm-f3206bf/
#rm pkg-plist
#make
#make makeplist > pkg-plist
#tail -n +2 "pkg-plist" > "pkg-plist.tmp" && mv "pkg-plist.tmp" "pkg-plist"
#make package
#make deinstall reinstall clean

echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "###- DONE -Now- REBOOT -###"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@"


