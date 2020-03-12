#!/bin/sh

read -p "git, enter email: " GIT_EMAIL
read -p "git, enter name: " GIT_NAME

cp .bashrc ~/.
apt-get install vim curl -y
cp -r .vim ~/.
cat .gitconfig \
    | sed -e "s/<insert name>/$GIT_NAME/g" \
    | sed -e "s/<insert email>/$GIT_EMAIL/g" \
    > ~/.gitconfig
