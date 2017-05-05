#!/bin/bash
read -p "Mac App Store username: " name
name=${name}

read -p "Mac App Store password: " password
password=${password}

echo "mas_email: $name
mas_password: $password
mas_installed_apps:
  - { id: 497799835, name: \"Xcode\" }
mas_upgrade_all_apps: no
mas_signin_dialog: no" | tee mas.yml