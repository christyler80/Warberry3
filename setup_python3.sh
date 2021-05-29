#!/bin/sh
apt-get update
apt-get -y upgrade
apt-get install -y git
apt-get install -y python-pip3
apt-get install -y python-is-python3
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
pip3 install dnspython
pip3 install setuptools
apt-get install -y libssl-dev libffi-dev python-dev build-essential
pip3 install asn1crypto==1.4.0
pip3 install crackmapexec
apt-get install -y nbtscan 
apt-get install -y python3-scapy
apt-get install -y wireshark-common 
apt-get install -y tcpdump 
apt-get install -y nmap  
pip3 install python-nmap 
apt-get install -y python-bluez 
apt-get install -y python-requests
pip3 install optparse-pretty 
pip3 install netaddr 
pip3 install prettytable 
apt-get install -y python-urllib3
pip3 install ipaddress
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
python3 warberryModel.py
