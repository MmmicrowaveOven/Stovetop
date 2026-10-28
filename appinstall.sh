#!/bin/bash

main() {
	sudo -v || exit 1
	yay_install
	install_apps
}

yay_install() {
	pacman -Syu --needed base-devel git
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
	cd ..
	rm -r yay
	yay -Y --gendb
	yay -Syu --devel
	yay -Y --devel --save
}

install_apps() {
	paru -S --needed --noconfirm lightdm lightdm0gtk-greeter niri quickshell pipewire pipewire-pulse pipewire-jack wireplumber qpwgraph guitarix timeshift firefox guitarix bitwig-studio steam ntsync-autoload alacritty fuzzel gedit yazi
}

setup_system() {
	systemctl enable lightdm
}

main
