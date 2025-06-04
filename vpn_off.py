#!/usr/bin/env python

import os
import subprocess as sp

def main():
	result = sp.run(["nmcli", "con", "down", "usa-newyork-udp"], text=True,
                          stdout=sp.PIPE, stderr=sp.PIPE)
	if result.returncode==0:
		print("VPN Connection Ended")
	else:
		print("Connection Still Active")


main()
