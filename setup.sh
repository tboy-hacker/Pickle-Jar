#!/bin/bash

Green=$'\e[1;32m'

echo"" "$Green"
cat pickleban.txt

sudo apt update
chmod +x pickle.sh
chmod +x scan.sh
sudo gem install XSpear
pip3 install -r requirements.txt
sudo apt install nyancat
sudo apt install joomscan
sudo apt install wpscan
echo "" "$Green"
echo "Done let's have a pickle"
