#!/usr/bin/env python

import os
import subprocess as sp
import requests
import ipget

def main():
	result = sp.run(["nmcli", "con", "up", "usa-newyork-udp"], text=True,
                          stdout=sp.PIPE, stderr=sp.PIPE)
	if result.returncode==0:
		print("VPN connection established")
		ipget.getter()	
	else:
		print("Connection Failed")


main()
