#!/bin/bash

exists=false
if pkgutil --pkgs=.\+CLTools_Executable.\+ > /dev/null ; then
        exists=true
fi

if ! $exists ; then
    xcode-select --install;
fi

echo "Please wait for xcode command line tools to finish installing"
echo -n "Tap \"y\" when command line tool installation has finished "
read answer
if echo "$answer" | grep -iq "^y" ;then
    sudo easy_install pip;
	sudo pip install ansible;
	cd ~ && cd Documents;
	mkdir Projects && cd Projects;
	git clone git://github.com/trusk89/iOS-dev-playbook.git;
	cd iOS-dev-playbook;
	./mac_app_store_config.sh;
	ansible-galaxy install -r requirements.yml;
	ansible-playbook -i inventory --ask-become-pass main.yml;

	cd ~/dotfiles;
	bin/install;
	bin/setup_osx;
else
    echo "The please wait for the installation to finish and try again"
fi