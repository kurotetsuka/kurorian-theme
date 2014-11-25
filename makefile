#globals
default:

#vars
version = 3.12.1
main_files = \
	gnome-shell gtk-2.0 gtk-3.0 legal metacity-1 \
	index.theme license.md readme.md
global_theme_dir = /usr/share/themes
user_theme_dir = ~/.local/themes
user_theme_dir2 = ~/.themes
install_dir_global = $(global_theme_dir)/kurorian-theme-$(version)
install_dir_local = $(user_theme_dir)/kurorian-theme-$(version)
install_dir_local2 = $(user_theme_dir2)/kurorian-theme-$(version)

#checks
check-root:
	[[ `whoami` = "root" ]]

check-install:
	test -d $(install_dir_global)
	echo -en "Kurorian Theme is installed\n"

check-local-install:
	test -d $(install_dir_local)
	echo -en "Kurorian Theme is installed locally\n"

#global installation
install: check-root
	#make dir
	mkdir -p $(install_dir_global)
	#install files
	cp -r $(main_files) $(install_dir_global)

uninstall: check-root
	#remove everything
	rm -f $(install_dir_global)

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

local-install-b:
	#make dir
	mkdir -p $(install_dir_local2)
	#install files
	cp -r $(main_files) $(install_dir_local2)

local-uninstall-b:
	#remove everything
	rm -f $(install_dir_local2)

local-reinstall-b: \
	local-uninstall local-install