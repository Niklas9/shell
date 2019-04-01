#!/bin/sh

curl -L -O https://github.com/Niklas9/shell/archive/master.tar.gz
tar -xf master.tar.gz
cd shell-master
./install_all.sh
cd ..
rm master.tar.gz

