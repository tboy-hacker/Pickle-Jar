#!/bin/bash

#color

red=$'\e[1;31m'
Green=$'\e[1;32m'
Orange=$'\e[1:33m'
Purple=$'\e[1;35m'
White=$'\e[0m'

#array
pypic=("pickle" "botnet.py" "die.py" "hrdevil.py" "httpdoser.py" "hulk.py" "m60.py")

#functions

item1() {
   echo ""
   sleep 1
   read -ep "DOMAIN IP : " IP
   echo "example : port 21-8080"
   read -ep "DOMAIN PORT : " PORT
   # Nmap Portion
   echo "$Purple"
   echo "----------------------- Basic Nmap Scan --------------------------"
   echo "$White"
   sudo nmap "$IP" -sV -O -p1-"$PORT" -o pickle-result/nmap.txt
   echo""

   echo "$Purple"
   echo "----------------------- Nmap Vuln Scan --------------------------"
   echo "$White"
   nmap --script vuln "$IP" -oN pickle-result/Nmapvuln.txt
   echo""
   # FFUF Portion
   echo "$red"
   echo "----------------------- FFUF Scan --------------------------"
   echo "$White"
   ffuf -c -w fuf.txt -u http://$IP/FUZZ -recursion -r -t 50 -o pickle-result/ffuf.txt
   echo ""

   # Nikto Portion
   echo "$Orange"
   echo "----------------------- Nikto Scan --------------------------"
   echo "$White"
   nikto -h "$IP" -output pickle-result/nikto.txt
   
  echo ''
  echo 'results in pickle-result'
 
   read 
   itemnone
}

item2() {
   echo ""
   sleep 1
   read -ep "DOMAIN IP : " IP
   echo "example : port 21-8080"
   
   read -ep "DOMAIN PORT : " PORT
   echo ""
   echo "----------------------- Vuln Scan --------------------------"
   sudo nmap -sV -p21-"$PORT" --script vulners "$IP" -o pickle-result/vulners.txt

   read 
   itemnone
}

item3() {

   gnome-terminal -- sudo python3 pwnxss.py
   itemnone
}

item4() {

  gnome-terminal --title=Bashter -- sudo bash bashter.bash
   itemnone
}

crascan() {
   gnome-terminal --title=Crascan -- sudo bash crascan.sh
   itemnone
}

item6() {
   clear
   cat pickleban.txt
   echo ""
   echo ""
   echo "pick a DDOS tool to use "
   echo ""
   echo "1 . Botnet"
   echo "2 . Die"
   echo "3 . Hrdevil"
   echo "4 . Httpdoser"
   echo "5 . Hulk"
   echo "6 . M60"
   echo "7 . Back"
   sleep 1
   echo ""
   echo -n "pickle> "
   read pickd
   case "$pickd" in
   "1") ddos1 ;;
   "2") ddos1 ;;
   "3") ddos1 ;;
   "4") ddos1 ;;
   "5") ddos1 ;;
   "6") ddos1 ;;
   "7") itemnone ;;
   *) item6 ;;
   esac
}
itemcms() {
  clear
   cat pickleban.txt
   echo ""
   echo ""
   echo "pick a cms to attack"
   echo ""
   echo "1 . Wordpress "
   echo "2 . joomla "
   echo "3 . Back"
   sleep 2
   echo ""
   echo -n "pickle> "
   read pickcm
   case "$pickcm" in
   "1") itemword ;;
   "2") itemjo ;;
   "3") itemnone ;;
   *) itemcms ;;
   esac
}
itemword(){
    echo ""
   sleep 1
   echo "example : https://example.com/"
   echo ""
   read -ep "DOMAIN NAME : " dnames
   if [ "$dnames" == "" ]; then
       itemnone
   else
    echo ""
    read -ep "wpscan api-token : " apitoken

    if [ "$apitoken" == "" ]; then
      echo ""
      gnome-terminal --title=wpscan -- sudo wpscan --url "$dnames" --random-user-agent
      itemnone
    else
    echo ""
    gnome-terminal --title=wpscan -- sudo wpscan --url "$dnames" --random-user-agent --api-token "$apitoken"
    itemnone
    fi
   fi

}
itemjo() {
   echo ""
   sleep 1
   echo "example : https://example.com/"
   echo ""
   read -ep "DOMAIN NAME : " dnames
   if [ "$dnames" == "" ]; then
       itemnone
   else
    echo ""
   gnome-terminal --title=Joomscan -- sudo joomscan -u "$dnames"
    itemnone
   fi
}

ddos1() {
   echo ""
   sleep 1
   echo "example : example.com"
   echo ""
   read -ep " DOMAIN NAME : " ddnames
   echo ""
   gnome-terminal -- python2 ddo/${pypic[$pickd]} http://www.$ddnames
   itemnone
}

item11() {
   gnome-terminal --title=Domain-Info -- sudo bash scan.sh
   itemnone
}

itemnone() {
   clear
   start
}
pick() {
   gnome-terminal -- sudo nyancat
   itemnone
}

start() {
   clear

   if [[ $EUID -ne 0 ]]; then
      echo "$red"
      echo "pls be a root user"
      exit 1
   fi
   echo"" "$Green"
   cat pickleban.txt
   echo ""
   echo ""
   echo "welcome to pickle-jar "
   echo ""
   echo "1 . Fast Port scanning"
   echo "2 . Strong Vuln scanning"
   echo "3 . Xss"
   echo "4 . Bashter"
   echo "5 . Crascan"
   echo "6 . Ddos"
   echo "7 . Find Domain Info"
   echo "8 . Cms"
   sleep 1
   echo ""
   echo -n "pickle> "
   read point
   case "$point" in
   "1") item1 ;;
   "2") item2 ;;
   "3") xss1 ;;
   "4") item4 ;;
   "5") crascan ;;
   "6") item6 ;;
   "7") item11 ;;
   "8") itemcms ;;
   "help" | "h") hel ;;
   "pickle") pick ;;
   "exit") clear ;;
   *) itemnone ;;
   esac

}
item13() {
   sudo python2 scan.py
   
}

xss1() {
   clear
   cat pickleban.txt
   echo ""
   echo ""
   echo "pick a xss tool to use "
   echo ""
   echo "1 . XSpear "
   echo "2 . Pwnxss "
   echo "3 . WebPwn3r"
   echo "4 . Back"
   sleep 2
   echo ""
   echo -n "pickle> "
   read  pickx
   case "$pickx" in
   "1") item7 ;;
   "2") item8 ;;
   "3") item13 ;;
   "4") itemnone ;;
   *) xss1 ;;
   esac
}

item7() {
   echo ""
   sleep 1
   echo "example : https://example.com"
   echo ""
   read -ep "DOMAIN NAME : " dnames
   echo ""
   if [ "$dnames" == "" ]; then
       itemnone
   else
    echo ""
   gnome-terminal --title=XSpear -- sudo XSpear -u "$dnames" -v 1
   itemnone
   fi
}

item8() {
   echo ""
   sleep 1
   echo "example : example.com"
   echo ""
   read -ep "DOMAIN NAME : " dnames
   echo ""
    if [ "$dnames" == "" ]; then
       itemnone
   else
    echo ""
    sudo python3 pwnxss.py -u http://www.$dnames
   itemnone
   fi
   
}
hel() {
   mousepad add.txt
   itemnone
}

#code
if [[ $EUID -ne 0 ]]; then
   echo "$red"
   echo "pls be a root user"
   exit 1
fi

clear
echo"" "$Green"
cat pickleban.txt
echo ""
echo ""
echo "welcome to pickle-jar "
echo ""
echo "1 . Fast Port scanning"
sleep 1
echo "2 . Strong Vuln scanning"
sleep 1
echo "3 . Xss"
sleep 1
echo "4 . Bashter"
sleep 1
echo "5 . Crascan"
sleep 1
echo "6 . Ddos"
sleep 1
echo "7 . Find Domain Info"
sleep 1
echo "8 . Cms"
sleep 2
echo ""
echo -n "pickle> "
read point
case "$point" in
"1") item1 ;;
"2") item2 ;;
"3") xss1 ;;
"4") item4 ;;
"5") crascan ;;
"6") item6 ;;
"7") item11 ;;
"8") itemcms ;;
"help" | "h") hel ;;
"pickle") pick ;;
"exit") clear ;;
*) itemnone ;;
esac