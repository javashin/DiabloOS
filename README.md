### DiabloOS FreeBSD Distro Fork Add-ON ###
* INDEX
1. freebsd-ports-diablo
### (DiabloOS GFX UPGRADE PORTS) ###
2. freebsd-diablo-config-files-seeds
### (DiabloOS Config Files) ###
### HOW TO USE THIS ###
- After Install FreeBSD
- To Deploy On OpenZFS ZfsOnLinux DataSet And Use ZOF ZfsOnFreeBSD Fork Modules And Avoid Using Legacy ZFS Code.
- Create The New dataset For Freebsd on A Zfs On Linux Pool with 
- Example : 

zfs create -o compression=lz4 -o acltype=noacl -o xattr=off -o atime=off -o mountpoint=/mnt/DiabloOS zroot/ROOT/DiabloOS

- Set The New Dataset As bootfs :

zpool set bootfs=zroot/ROOT/DiabloOS zroot
zpool set cachefile=/etc/zfs/zpool.cache zroot
cp /etc/zfs/zpool.cache /mnt/DiabloOS/boot/zfs/zpool.cache

- Mount Efi ESP Partition Copy FreeBSD Loader.
mount /dev/sda1 /boot/efi 
cp /mnt/DiabloOS/boot/loader.efi /boot/efi/EFI/FreeBSD/loader.efi

- Install refind-efi and install refind-install with efi esp mounted. boot freebsd from it.



