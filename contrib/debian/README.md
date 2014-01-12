
Debian
====================
This directory contains files used to package storecoind/storecoin-qt
for Debian-based Linux systems. If you compile storecoind/storecoin-qt yourself, there are some useful files here.

## storecoin: URI support ##


storecoin-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install storecoin-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your storecoin-qt binary to `/usr/bin`
and the `../../share/pixmaps/storecoin128.png` to `/usr/share/pixmaps`

storecoin-qt.protocol (KDE)

