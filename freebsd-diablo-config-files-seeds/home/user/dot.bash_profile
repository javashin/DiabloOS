export LIBGL_DRI3_ENABLE=1
export LIBGL_DEBUG=verbose
GTK_MODULES="$GTK_MODULES:canberra-gtk-module" 
export GTK_MODULES 
EDITOR=nano; export EDITOR
QT_QPA_PLATFORMTHEME=qt5ct; export QT_QPA_PLATFORMTHEME 
LANG=en_US.UTF-8;   export LANG
CHARSET=UTF-8;  export CHARSET

PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:/home/javashin/bin:/usr/local/openjdk12/bin/; 
export PATH

#export PULSE_CLIENTCONFIG=~/.config/pulse.conf
export mesa_glthread=true
export XDG_SESSION_TYPE=X11
export NO_AT_BRIDGE=1
export QT_QPA_PLATFORMTHEME=qt5ct
export XDG_SESSION_CLASS=X11
LIBGL_DRI3_ENABLE=1; export LIBGL_DRI3_ENABLE




#sudo zfs mount zroot/ROOT/Gentoo
#sudo zfs mount zroot/ROOT/OpenSuse

#sudo kldload i915kms 
#/usr/local/bin/fixpulse &>> /dev/null &
startx &>> .xorg.log



