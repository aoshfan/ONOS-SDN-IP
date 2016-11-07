#!/bin/bash

echo "Checking Open vSwitch status..."
while true; do
      if [ -S /var/run/openvswitch/db.sock ]; then
         break
      fi
      sleep 2
done

echo "Configuring Open vSwitch..."
ovs-vsctl add-br s14
ovs-vsctl add-port s14 eth1
ovs-vsctl add-port s14 eth2
ovs-vsctl add-port s14 eth3
ovs-vsctl set bridge s14 other-config:hwaddr=00:00:00:00:00:14
ovs-vsctl set bridge s14 protocols=OpenFlow13
ovs-vsctl set-controller s14 tcp:10.100.10.1:6633
ovs-vsctl set-fail-mode s14 secure
