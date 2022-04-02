#!/usr/bin/env bash

set -e


################################################################################
### Head: Theme
##
theme_asset_install () {

	echo "## Asset: theme"
	echo

	theme_asset_install_gruvbox_gtk


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
