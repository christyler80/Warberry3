#!/bin/sh
apt-get update
apt-get -y upgrade
apt-get install -y git
apt-get install -y python-pip
if [ -d "Results" ] 
then
    rm -r Results
fi
mkdir Results
if [ -d "Tools" ] 
then
    rm -r Tools
fi
mkdir Tools
pip install dnspython
pip install setuptools
apt-get install -y libssl-dev libffi-dev python-dev build-essential
pip install crackmapexec
apt-get install -y nbtscan 
apt-get install -y python-scapy
apt-get install -y wireshark-common 
apt-get install -y tcpdump 
apt-get install -y nmap  
pip install python-nmap 
apt-get install -y python-bluez 
apt-get install -y python-requests
pip install optparse-pretty 
pip install netaddr 
pip install prettytable 
apt-get install -y python-urllib3
pip install ipaddress
apt-get install -y ppp 
apt-get install -y xprobe2 
apt-get install -y sg3-utils 
apt-get install -y netdiscover 
apt-get install -y macchanger 
apt-get install -y unzip 
wget https://svn.nmap.org/nmap/scripts/clamav-exec.nse -O /usr/share/nmap/scripts/clamav-exec.nse
cd Tools
apt-get install -y onesixtyone 
apt-get install -y bridge-utils 
apt-get install -y ettercap-text-only 
apt-get install -y ike-scan 
apt-get install -y samba samba-common-bin
git clone https://github.com/SpiderLabs/Responder.git
wget --no-check-certificate https://labs.portcullis.co.uk/download/enum4linux-0.8.9.tar.gz -O enum4linux-0.8.9.tar.gz
tar -zxvf enum4linux-0.8.9.tar.gz
mv enum4linux-0.8.9 enum4linux
apt-get install sqlite3 libsqlite3-dev
cd  ..
if [ -f "warberry.db" ] 
then
    rm warberry.db 
fi
sqlite3 warberry.db ".read warberryDBCreation"
python warberryModel.py
