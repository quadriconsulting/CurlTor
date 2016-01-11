#!/bin/bash

#http://stackoverflow.com/questions/18215973/how-to-check-if-running-as-root-in-a-bash-script
if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi

# needed to get new identity. Seems to be the fastest way to get new identity according to multiple internet sources
service tor reload

echo "Your TOR IP address is:"
curl --socks http://localhost:9050 -L http://icanhazip.com

