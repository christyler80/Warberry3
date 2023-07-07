"""
This file is part of the WarBerry tool.
Copyright (c) 2018 Yiannis Ioannides (@sec_groundzero).
https://github.com/secgroundzero/warberry
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
"""

import os, os.path
import nmap
import sys
from src.utils.console_colors import *
from src.utils.port_obj_Read import port_obj_reader
from src.warberrySetup.WarberryDB import *

class targettedScanner:

    def __init__(self):
        self.scanners={}

    def single_port_scanner(self,CIDR, intensity, iface, hostlist, war_db):
        print( "\r" +" ")
        print( "\r" +bcolors.OKGREEN + " [ TARGETTED SERVICES NETWORK SCANNER MODULE ]\r\n" + bcolors.ENDC)
        print( "\r" +"\r\n[*] Beginning Scanning Subnet %s" % CIDR)
        print( "\r" +" ")

        # port_obj_reader reads portlist_config file and creates a list with port_objects for scalability.
        # port list input filename is as below.
        ports_list = port_obj_reader("portlist_config")
        for i in ports_list:
            temp = []
            count = 0
            #for key, value in vars(i).items():
            for key, value in sorted(vars(i).items()):
                temp.append(value)
                count += 1
            scan=Scanner()
            self.scanners[str(temp[1])] = scan.scanner(str(temp[1]), str(temp[3]).split('.'), str(temp[0]), intensity,
                                                       str(temp[5]), hostlist, iface, war_db)
            #self.scanners[str(temp[0])] = scan.scanner(str(temp[0]), str(temp[5]).split('.'), str(temp[4]), intensity,
            #                                           str(temp[1]), hostlist, iface, war_db)

class Scanner:
    def scanner(self,name, port, message, intensity, type, hostlist, iface, war_db):
        if sys.version_info.major >= 3:
            trantab = str.maketrans(' ', ' ', '\'\"][ ')
            port = str(port).translate(trantab)
        else:
            port = str(port).translate(None, '\'\"][ ')
        port = port.split(',')
        print( "\r" +"[+] Scanning for " + name + " ... \r\n")
        nm = nmap.PortScanner()
        hosts = []
        for i in range(0, len(port)):
            if sys.version_info.major >= 3:
                trantab = str.maketrans(' ', ' ', '\'][ ')
                if (type == "y"):
                    arg = "-Pn -sU -p:" + str(port[i]).translate(trantab) + " " + intensity + " --open"
                elif (type == "n"):
                    arg = "-Pn -p" + str(port[i]).translate(trantab) + " " + intensity + " --open"
                elif (type == "yn"):
                    arg = "-Pn -p -st -sU" + str(port[i]).translate(trantab) + " " + intensity + "--open"
            else:
                if (type == "y"):
                    arg = "-Pn -sU -p:" + str(port[i]).translate(None, '\'][ ') + " " + intensity + " --open"
                elif (type == "n"):
                    arg = "-Pn -p" + str(port[i]).translate(None, '\'][ ') + " " + intensity + " --open"
                elif (type == "yn"):
                    arg = "-Pn -p -st -sU" + str(port[i]).translate(None, '\'][ ') + " " + intensity + "--open"
            arg += " -e " + iface
            for h in hostlist:
                nm.scan(hosts=h, arguments=arg)
                for host in nm.all_hosts():
                    print( "\r" +"----------------------------------------------------")
                    hosts.append(host)
                    print( "\r" +bcolors.OKGREEN + "*** " + name + " Found : %s via port " % host + str(
                        port) + " ***" + bcolors.ENDC)
                    war_db.insertScanner(name,host)
                    print( "\r" +bcolors.TITLE + message + bcolors.ENDC + "\r")
                    #print( "\r" +bcolors.TITLE + "\r\n[+] Done! Results saved in warberry.db"  "\r\n" + bcolors.ENDC)
        return hosts

