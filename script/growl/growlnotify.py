#!/usr/bin/env python

from netgrowl import * 
import sys
#import socket

#title = "Notification from " + socket.gethostname()
#desc = "" if len(sys.argv) > 2
if len(sys.argv) < 3:
	exit()

hostname="YinKe_10_1_148_160" #socket.gethostname() 
ip = sys.argv[1]
title = sys.argv[2]
desc = sys.argv[3]

addr = (ip, GROWL_UDP_PORT) 
s = socket(AF_INET,SOCK_DGRAM) 
p = GrowlRegistrationPacket(application=hostname, password="000000") 
p.addNotification(hostname + "Notifications", enabled=True)
s.sendto(p.payload(), addr) 

p = GrowlNotificationPacket(application=hostname, notification=hostname + "Notifications", title=title, description=desc, priority=1, sticky=True, password="000000")

s.sendto(p.payload(),addr) 
s.close() 
