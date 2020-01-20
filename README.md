### DiabloOS FreeBSD Distro Fork Add-ON By JavaShin-X ###
### The Goal Of This Project Is Manually Install A Fully Optimized FreeBSD OS For Desktop/Laptop Not For NOOBS.

1. Install Any Branch -RELEASE -STABLLE -CURRENT To ZOF https://zfsonfreebsd.github.io/ZoF/ .

2. Remove Old Legacy Opensolaris ZFS From Kernel And Base (World/Userland) After make buildworld buildkernel installkernel reboot into single user installworld merge config files and remove old libs and bins Very Normal To Any l33t On Their Geek Boxes.

3. Configure & Recompile The Kernel And Make It Thin-Optimized-Custom Removing Unwanted Modules Debugging Symols On -CURRENT. 

4. Remove Native Sound Drivers And Add 4Front Technologies OSS4 http://www.opensound.com/oss.html .

5. Everything And All Compiled With The Level 3 Of Compiler (-O3) Kernel+World Plus Some Key Ports That Increase Performace. 

6. Upgrade The GFX STACK =
Libdrm (last stable version) \
Mesa 3D OpenGL Vulkan Libs And DRI (last stable version) \  
X11 Xorg-server (Last Master Tip From Gitlab) \
Linux Kernel 5.0 KMS DRM Video DRIVERS. \
On Desktops Like Mate Xfce4 Lxqt Lxde Or Just Window Managers BOXes Make Use Of The Best Compositor For Any Unix System "Picom" A Fork Of Compton Which Works Great. \
On Kde Plasma 5 Recompile Kwin With lowlatency Patches For The Best Performance. \
Gnome ?

7. Make your own -RELEASE DistFiles Manifest Tarballs And Memstick Or ISO & Booteable System For Any Situation.

8. Finito Fin Finale EnD.

* INDEX

1. freebsd-ports-diablo

### (DiabloOS GFX UPGRADE PORTS) ###

2. freebsd-diablo-config-files-seeds

### (DiabloOS Config Files) ###

### HOW TO USE THIS REPO = ###

- After Install FreeBSD With src and ports from the installer and updated with freebsd-update if is -RELEASE Installation BOX for -STABLE And -CURRENT freebsd-update dont work Just Install From The Latest And Greatest Snapshot -STABLE Dont Have Debug Symbols 13-CURRENT Does More Work Is Needed But 13-CURRENT is THE BEST Way to Go.  

- openzfs & openzfs-kmod ports both compiled and installed. (Inside VirtualBox Before Mount And Deduplicate).
1. With = portsnap auto ; cd /usr/ports/sysutils/openzfs-kmod ; make install clean ; cd /usr/ports/sysutils/openzfs ; make install clean

* Recommended But Optional Install On VirtualBox From Your Linux Distribution Installed On ZFS Working And Running , Inside VirtualBox Install -RELEASE , -STABLE or -CURRENT On AutoUFS Formated VDI Mount On Linux Using NBD Kernel Module Interface And Extract The ROOT FS TREE Making A Exact Copy With "cpdup" To The New Dataset.
Linux installed on zfs is not necessary just have working zfs modules and zfs utils better from last master tip from git.

- To Deploy On OpenZFS ZfsOnLinux DataSet And Use ZOF ZfsOnFreeBSD Fork Modules And Avoid Using Legacy ZFS Code.
- Create The New dataset For Freebsd on A Zfs On Linux Pool with 
- Example : 

1. zfs create -o compression=lz4 -o acltype=noacl -o xattr=off -o atime=off -o mountpoint=/mnt/DiabloOS zroot/ROOT/DiabloOS

- Mount VirtualBox Virtual HD VDI With qemu-nbd :
1. modprobe nbd
2. qemu-nbd -c /dev/nbd0 /path/to/DiabloOS.vdi
3. run blkid and check which is the ufs root partition
4. mkdir /mnt/freebsd ; mount -t ufs -r -o ufstype=ufs2 /dev/nbd0* /mnt/freebsd

- Deduplicate FreeBSD from Ufs On NBD VDI Mounted. To ZOL DATASET
1. mount ZOL dateset if is not mounted - zfs mount zroot/ROOT/DiabloOS
2. time cpdup -vvv -o /mnt/freebsd /mnt/DiabloOS 

- Set The New Dataset As bootfs :

1. zpool set bootfs=zroot/ROOT/DiabloOS zroot

2. zpool set cachefile=/etc/zfs/zpool.cache zroot

3. cp /etc/zfs/zpool.cache /mnt/DiabloOS/boot/zfs/zpool.cache

- Mount Efi ESP Partition Copy FreeBSD Loader.

1. mount /dev/sda1 /boot/efi 

2. cp /mnt/DiabloOS/boot/loader.efi /boot/efi/EFI/FreeBSD/loader.efi

- Configure The FreeBSD Loader :
1. edit /mnt/DiabloOS/boot/loader.conf and Add The following = 

vfs.root.mountfrom="zfs:rpool/ROOT/DiabloOS"
openzfs_load="YES" \
vfs.zfs.arc.max="1073741824" \
zpool_cache_load="YES" \
zpool_cache_type="/boot/zfs/zpool.cache" \
zpool_cache_name="/boot/zfs/zpool.cache" \
zfs_load="NO" \
opensolaris_load="NO"

- Install the pkg from your linux distro refind-efi bootloader and install with refind-install to efi esp mounted. boot freebsd from it.


### Continue With The Compilation Of A New Kernel "Thin Kernel" "Optimized Kernel" With ZFS Disabled And Audio to Enable OSS4 And With RealTime ON. And Upgrade The GFX STACK.

### Everything Here Is BSD2CLAUSE , Creative Commons , Do What The FUck U Want With It.

JavaShin-X 2020.





