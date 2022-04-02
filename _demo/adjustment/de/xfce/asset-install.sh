#!/usr/bin/env bash

set -e


################################################################################
### Head: Theme
##
theme_asset_install () {

	echo "## Asset: theme"
	echo

	theme_asset_install_gruvbox_gtk
	theme_asset_install_gruvbox_icon


	echo

}

##
### Tail: Theme
################################################################################


################################################################################
### Head: Theme / Gruvbox / Gtk
##
theme_asset_install_gruvbox_gtk () {

	echo

	if [ -a "$HOME/.themes/Gruvbox" ]; then
		echo
		echo "## Theme Exists:" "$HOME/.themes/Gruvbox"
		echo
		return 0
	fi


	theme_asset_install_gruvbox_gtk_download

	theme_asset_install_gruvbox_gtk_install
}

theme_asset_install_gruvbox_gtk_download () {

	if [ -a "./tmp/Theme_Gruvbox_Source" ]; then
		echo
		echo "## Theme Source Exists:" "./tmp/Theme_Gruvbox_Source"
		echo
		return 0
	fi

	echo
	echo "mkdir -p ./tmp"
	mkdir -p ./tmp


	##
	## * https://github.com/archcraft-os/archcraft-themes
	##
	echo "git clone https://github.com/archcraft-os/archcraft-themes.git ./tmp/Theme_Gruvbox_Source"
	git clone https://github.com/archcraft-os/archcraft-themes.git ./tmp/Theme_Gruvbox_Source

}

theme_asset_install_gruvbox_gtk_install () {

	if ! [ -a "./tmp/Theme_Gruvbox_Source/archcraft-gtk-theme-gruvbox/files/Gruvbox" ]; then
		echo
		echo "## Theme Gruvbox Not Exists:" "./tmp/Theme_Gruvbox_Source/archcraft-gtk-theme-gruvbox/files/Gruvbox"
		echo
		return 0
	fi


	echo "mkdir -p $HOME/.themes"
	mkdir -p "$HOME/.themes"

	echo "cp -a ./tmp/Theme_Gruvbox_Source/archcraft-gtk-theme-gruvbox/files/Gruvbox $HOME/.themes/Gruvbox"
	cp -a "./tmp/Theme_Gruvbox_Source/archcraft-gtk-theme-gruvbox/files/Gruvbox" "$HOME/.themes/Gruvbox"

}


##
### Tail: Theme / Gruvbox / Gtk
################################################################################


################################################################################
### Head: Theme / Gruvbox / Icon
##
theme_asset_install_gruvbox_icon () {

	echo

	if [ -a "$HOME/.icons/Gruvbox-Dark" ]; then
		echo
		echo "## Icons Exists:" "$HOME/.icons/Gruvbox-Dark"
		echo
		return 0
	fi


	theme_asset_install_gruvbox_icon_download

	theme_asset_install_gruvbox_icon_install
}

theme_asset_install_gruvbox_icon_download () {

	if [ -a "./tmp/Icons_Gruvbox_Source" ]; then
		echo
		echo "## Icons Source Exists:" "./tmp/Icons_Gruvbox_Source"
		echo
		return 0
	fi

	echo
	echo "mkdir -p ./tmp"
	mkdir -p ./tmp


	##
	## * https://github.com/jmattheis/gruvbox-dark-icons-gtk
	##
	echo "git clone https://github.com/jmattheis/gruvbox-dark-icons-gtk.git ./tmp/Icons_Gruvbox_Source"
	git clone https://github.com/jmattheis/gruvbox-dark-icons-gtk.git ./tmp/Icons_Gruvbox_Source

}

theme_asset_install_gruvbox_icon_install () {

	if ! [ -a "./tmp/Icons_Gruvbox_Source" ]; then
		echo
		echo "## Icons Gruvbox Not Exists:" "./tmp/Icons_Gruvbox_Source"
		echo
		return 0
	fi


	echo "mkdir -p $HOME/.icons"
	mkdir -p "$HOME/.icons"

	echo "cp -a ./tmp/Icons_Gruvbox_Source $HOME/.icons/Gruvbox-Dark"
	cp -a "./tmp/Icons_Gruvbox_Source" "$HOME/.icons/Gruvbox-Dark"

	rm -rf "$HOME/.icons/Gruvbox-Dark/.git"

	#rsync -r --exclude '.git' "./tmp/Icons_Gruvbox_Source" "$HOME/.icons/Gruvbox-Dark"
}


##
### Tail: Theme / Gruvbox / Icon
################################################################################


################################################################################
### Head: main
##
main_asset_install () {
	theme_asset_install
}
## start
main_asset_install

##
### Tail: main
################################################################################
