#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
lfile="/tmp/xinit.log"
touch $lfile

# sudo chown -R tom:tom /sys/class/backlight/intel_backlight/*

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi
# . ~/.profile


#~/bin/kb
#autorandr --change --force --debug >> $lfile 2>&1
#xset +fp /usr/share/fonts/local &
#xset fp rehash &
pkill xsettingsd ; xsettingsd &
xsetroot -cursor_name left_ptr >> $lfile 2>&1
#. "${HOME}/.cache/wal/colors.sh"
#kil compton >> $lfile 2>&1
#kil redshift >> $lfile 2>&1

#numlockx &
#unclutter &
#xbindkeys &
#nitrogen --restore &
#lxpolkit &
#parcellite &
#urxvtd -q -o -f
#exec herbstluftwm --locked
#~/bin/monitors 5 >> $lfile 2>&1 &
#~/bin/wp >> $lfile 2>&1
#exec dwm > /tmp/dwm.log 2>&1
#/home/tom/bin/term &
#exec /home/tom/src/tinywm/tinywm > /tmp/tinywm.log 2>&1
#exec i3 > /tmp/i3.log 2>&1
#autorandr --force -c
# exec spectrwm | tee /tmp/spectrwm.log 2>&1
# xrandr --output eDP-1 --mode 2048x1152
# /home/tom/bin/screens
~/.screenlayout/$(hostname).sh
exec bspwm | tee /tmp/bspwm.log 2>&1
# exec openbox
#exec wingo --log-level="4" > /tmp/wingo.log 2>&1
#exec xmonad > /tmp/xmonad.log 2>&1
