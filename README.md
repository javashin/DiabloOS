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

1. zfs create -o compression=lz4 -o acltype=noacl -o xattr=off -o atime=off -o mountpoint=/mnt/DiabloOS zroot/ROOT/DiabloOS

- Set The New Dataset As bootfs :

1. zpool set bootfs=zroot/ROOT/DiabloOS zroot

2. zpool set cachefile=/etc/zfs/zpool.cache zroot

3. cp /etc/zfs/zpool.cache /mnt/DiabloOS/boot/zfs/zpool.cache

- Mount Efi ESP Partition Copy FreeBSD Loader.

1. mount /dev/sda1 /boot/efi 

2. cp /mnt/DiabloOS/boot/loader.efi /boot/efi/EFI/FreeBSD/loader.efi

- Install refind-efi and install refind-install with efi esp mounted. boot freebsd from it.



