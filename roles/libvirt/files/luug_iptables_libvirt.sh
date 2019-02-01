#!/bin/bash
iptables -A FORWARD -i br0 -o br0 -j ACCEPT
