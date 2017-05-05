#!/bin/bash
xcode-select --install;
echo -n "Did Xcode tools finish installing? (y/n)? "
read answer
if echo "$answer" | grep -iq "^y" ;then
    sudo easy_install pip;
	sudo pip install ansible;
	cd ~ && cd Documents;
	mkdir Projects && cd Projects;
	git clone https://github.com/trusk89/mac-dev-playbook.git;
	cd mac-dev-playbook;
	ansible-galaxy install -r requirements.yml;
	ansible-playbook -i inventory --ask-become-pass main.yml;

	cd ~/dotfiles;
	bin/install;
	bin/setup_osx;
else
    echo "The please wait to finish and try again"
fi