#!/bin/bash

sudo ifconfig enx00e04c6800d2 up
sudo ifconfig enx00e04c6800d2 192.168.10.30 netmask 255.255.255.0 mtu 9000
