#!/bin/sh

read -p "git, enter email: " GIT_EMAIL
read -p "git, enter name: " GIT_NAME

cp .bashrc ~/.
sudo apt-get install vim curl s3cmd -y
cp -r .vim ~/.
cp .mongorc.js ~/.
cat .gitconfig \
    | sed -e "s/<insert name>/$GIT_NAME/g" \
    | sed -e "s/<insert email>/$GIT_EMAIL/g" \
    > ~/.gitconfig
cp .screenrc ~/.
cp .s3cfg ~/.
