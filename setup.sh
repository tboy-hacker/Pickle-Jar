#!/bin/bash

Green=$'\e[1;32m'

echo"" "$Green"
cat pickleban.txt

sudo apt update
chmod +x pickle.sh
chmod +x scan.sh
sudo gem install XSpear
pip3 install -r requirements.txt
sudo apt install nyancat -y


sudo apt install gnome-terminal -y
sudo apt install joomscan -y
sudo apt install wpscan -y
echo "" "$Green"
echo "Done let's have a pickle"
