![alt tag](https://github.com/secgroundzero/warberry/blob/master/Warberry_Logo_Transparent.png)

[![ToolsWatch Best Tools](https://www.toolswatch.org/badges/toptools/2016.svg)](https://www.toolswatch.org/2017/02/2016-top-security-tools-as-voted-by-toolswatch-org-readers/)
[![Black Hat Arsenal](https://www.toolswatch.org/badges/arsenal/2016.svg)](https://www.blackhat.com/us-16/arsenal.html)
![GPLv3 License](https://img.shields.io/badge/License-GPLv3-red.svg)
[![Python 2.6|2.7](https://img.shields.io/badge/python-2.6|2.7-yellow.svg)](https://www.python.org/)
[![Python 3.7](https://user-images.githubusercontent.com/24506694/120064697-78738a80-c065-11eb-844b-00966884b20a.png)](https://www.python.org/)

#### This project is forked from the original [secgroundzero/warberry project](https://github.com/secgroundzero/warberry) and updated to be Python 3 compatible.

The original author stopped maintaining the secgroundzero/warberry project in November 2019. 
 
**WarBerryPi** was built to be used as a hardware implant during red teaming scenarios where we want to obtain as much information as possible in a short period of time with being as stealthy as possible. 

The WarBerry python script runs a collection of open source scanning tools to provide that functionality.

These tools include nmap, crackmapexec, tcpdump, netdiscover and others typically found in Kali Linux. 

The scripts have been designed to avoid noise in the network that could lead to detection and to be as efficient as possible. 

Results are stored in a SQLite3 database and basic PHP reporting is included.

This version of WarberryPi has been developed to run under Python 3 on Kali Linux. 

Other Debian based distros such as Ubuntu should work, but are likely to require manual installation of some components.


#### Disclaimer
This tool is only for academic purposes and testing under controlled environments. Do not use without obtaining proper authorisation from the network owner of the network under testing.

The author(s) bears no responsibility for any use (including misuse) of the tool.


#### Usage

To get a list of all options and switches use:

```python warberry.py -h```
```

Options:

  --version                             show program's version number and exit
  -h, --help                            show this help message and exit
  -p PACKETS,   --packets=PACKETS       Number of Network Packets to capture. Default 20
  -x TIME,      --expire=TIME		Duration of packet capture. Default 20 seconds
  -I IFACE,     --interface=IFACE       Network Interface to use. Default: eth0
  -N NAME,      --name=NAME             Hostname to use. Default: WarBerry
  -i INTENSITY, --intensity=INTENSITY   Port scan intensity. Default: T4
  -Q, --quick                           Scan using threats. Default: Off
  -P, --poison                          Turn Poisoning on/off. Default: On
  -t TIME, 	--time=TIME		Poisoning Duration. Default 900 seconds
  -H, --hostname                        Do not Change WarBerry hostname Default: Off
  -e, --enumeration                     Disable Enumeration mode. Default: Off
  -B, --bluetooth                       Enable Bluetooth scanning. Default: Off
  -r, --recon                           Enable Recon only mode. Default: Off
  -W, --wifi                            Enable WiFi scanning. Default: Off
  -S, --sniffer                         Enable Sniffer only mode. Default: Off
  -C, --clear                           Clear previous output folders in ../Results

```


### Environment

Warberry3 is designed to be run as root, otherwsise some modules will fail to install and/or run corectly.

On some systems, it may be necessary for Warberry3 to be installed and run from inside a Python Vertual Envirnment.

```
sudo apt-get update && sudo apt-get update
sudo apt install python3-pip
sudo apt install python3-venv

python3 -m venv .venv                     Creates a virtual environment named .venv.
source .venv/bin/activate                 If it worked, you should see (.venv) before the command prompt. 
deactivate                                When you're finished with your virtual environment.
```


### Installation

```
sudo apt-get update && sudo apt-get upgrade
sudo apt-get upgrade python3

git clone https://github.com/christyler80/Warberry3.git
cd warberry3
chmod 755 *.sh

As root user (or sudo su)

python3 -m venv .venv                     Creates a virtual environment named .venv.
source .venv/bin/activate                 If it worked, you should see (.venv) before the command prompt. 

cd Warberry3
./warberry3_setup.sh

deactivate                                When you're finished with your virtual environment.
```


#### To address the issue with ImportError: No module named dns follow these steps

```
git clone https://github.com/rthalley/dnspython
cd dnspython/
python setup.py install
```


### Run Warberry3 

```
python3 -m venv .venv                     Creates a virtual environment named .venv.
source .venv/bin/activate                 If it worked, you should see (.venv) before the command prompt. 

./warberry3_scan.sh                       Depending on network size and complexity, this may take several hours to complete.

deactivate                                When you're finished with your virtual environment.
```


### Reporting 

Download the **/RESULTS** folder into /var/www, /Library/Webserver/Documents/  or XAMPP web directory depending on your OS and setup.

Download the warberry.db file locally and save it into **Reporting/** .

Change file Config.php under Reporting/WarberryReporting/SQLiteConnection/php to use the correct path of warberry.db

Run index.html under **Reporting/**

