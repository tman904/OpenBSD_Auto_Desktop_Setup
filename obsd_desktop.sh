#!/bin/sh

#Date:3/3/2025 @22:05 hours
#Author: Tyler K Monroe aka tman904
#Purpose:Automatically configure an OpenBSD xorg desktop system with my preferred software and desktop environment!

#Run this as root and make sure to change user variable directly below this comment to you username this won't work on your system otherwise.
user="tman"

#Make configuration of ONLY touchpad settings as root passwordless.
echo "permit nopass $user as root cmd wsconsctl" > /etc/doas.conf

#Install my programs
pkg_add firefox ratpoison ffmpeg

#Enable touchpad settings and my desktop env when my xorg session starts
echo "doas wsconsctl mouse.reverse_scrolling=1" > /home/$user/.xsession
echo "doas wsconsctl mouse.tp.tapping=1" >> /home/$user/.xsession
echo "/usr/local/bin/ratpoison" >> /home/$user/.xsession

#Enable login manager on boot
rcctl enable xenodm
rcctl start xenodm
