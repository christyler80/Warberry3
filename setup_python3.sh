#!/bin/sh
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install -y git
sudo apt-get install -y python3-pip
sudo apt-get install -y python-is-python3
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
sudo apt-get install -y libssl-dev libffi-dev python-dev-is-python3 build-essential
pip3 install asn1crypto
sudo apt-get install crackmapexec
pip3 install crackmapexec
sudo apt-get install -y nbtscan 
sudo apt-get install -y python3-scapy
sudo apt-get install -y wireshark-common 
sudo apt-get install -y tcpdump 
sudo apt-get install -y nmap  
pip3 install python-nmap 
sudo apt-get install -y python3-bluez 
sudo apt-get install -y python3-requests
pip3 install optparse-pretty 
pip3 install netaddr 
pip3 install prettytable 
sudo apt-get install -y python3-urllib3
pip3 install ipaddress
sudo apt-get install -y ppp 
sudo apt-get install -y xprobe2 
sudo apt-get install -y sg3-utils 
sudo apt-get install -y netdiscover 
sudo apt-get install -y macchanger 
sudo apt-get install -y unzip 
sudo wget https://svn.nmap.org/nmap/scripts/clamav-exec.nse -O /usr/share/nmap/scripts/clamav-exec.nse
cd Tools
sudo apt-get install -y onesixtyone 
sudo apt-get install -y bridge-utils 
sudo apt-get install -y ettercap-text-only 
sudo apt-get install -y ike-scan 
sudo apt-get install -y samba samba-common-bin
git clone https://github.com/lgandx/Responder.git
wget --no-check-certificate https://labs.portcullis.co.uk/download/enum4linux-0.8.9.tar.gz -O enum4linux-0.8.9.tar.gz
tar -zxvf enum4linux-0.8.9.tar.gz
mv enum4linux-0.8.9 enum4linux
sudo apt-get install sqlite3 libsqlite3-dev
cd  ..
if [ -f "warberry.db" ] 
then
    rm warberry.db 
fi
sqlite3 warberry.db ".read warberryDBCreation"
python3 warberryModel.py
