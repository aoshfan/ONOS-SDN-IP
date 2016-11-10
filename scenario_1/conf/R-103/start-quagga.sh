#!/bin/bash

pkill -f zebra
pkill -f bgpd

sleep 5

chmod a+w /var/run
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
zebra -d
bgpd -d
