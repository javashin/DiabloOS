#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/usr/local/etc/X11/xinit/.Xresources
sysmodmap=/usr/local/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /usr/local/etc/X11/xinit/xinitrc.d ] ; then
	for f in /usr/local/etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi










#exec startfluxbox
picom --experimental-backends --backend glx --vsync &

#killall -9 pulseaudio ; pulseaudio --disable-shm=true &  pulseaudio -k ; killall -9 pulseaudio ; pulseaudio --disable-shm=true  & 
#xfwm4 &

#exec ck-launch-session dbus-launch --exit-with-session dbus-run-session mate-session

#startplasma-x11
#mate-session


#export QT_QPA_PLATFORMTHEME=qt5ct 
exec ck-launch-session dbus-launch mate-session
#startlxqt

#--exit-with-session mate-session


