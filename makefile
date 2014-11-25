#vars
version = 3.12
main_files = \
	gnome-shell gtk-2.0 gtk-3.0 \
	index.theme metacity-1 openbox
install_dir = /usr/share/themes/kurorian-theme-$(version)
user_theme_dir = ~/.themes
install_dir_local = $(user_theme_dir)/kurorian-theme-$(version)

#checks
check-root:
	[[ `whoami` = "root" ]]

check-install:
	[ -d $(install_dir) ]
	echo -en "Kurorian Theme is installed\n"

check-local-install:
	[ -d $(install_dir) ]
	echo -en "Kurorian Theme is installed locally\n"

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