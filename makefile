#vars
ff_files = FireFox/chrome
main_files = \
	gnome-shell gtk-2.0 gtk-3.0 \
	index.theme metacity-1 openbox-3 unity \
	xfce-notify-4.0 xfwm4
install_dir = /usr/share/themes/dorian-theme
install_dir_local = ~/.local/themes

#checks
check-root:
	[[ `whoami` = "root" ]]

check-install:
	[ -d $(install_dir) ]
	echo -en "Dorian Theme is installed\n"

check-local-install:
	[ -d $(install_dir) ]
	echo -en "Dorian Theme is installed locally\n"

#global installation
install: check-root
	#make dir
	mkdir -p $(install_dir)
	#install files
	cp -r $(main_files) $(install_dir)

uninstall: check-root
	#remove everything
	rm -f $(install_dir)

reinstall: check-root \
	uninstall install

#local installation
local-install:
	#make dir
	mkdir -p $(install_dir_local)
	#install files
	cp -r $(main_files) $(install_dir_local)

local-uninstall:
	#remove everything
	rm -f $(install_dir_local)

local-reinstall: \
	local-uninstall local-install