#!/bin/bash
#--------------------Tests------------------------------
NS1="NS1"
#Ping adaptor attached to NS1
sudo ip netns exec $NS1 ping -W 1 -c 2 172.16.0.2

#Ping the bridge
sudo ip netns exec $NS1 ping -W 1 -c 2 172.16.0.1

#Ping the adaptor of the second container
sudo ip netns exec $NS1 ping -W 1 -c 2 172.16.0.3

#Ping the other server (Ubuntu2)
sudo ip netns exec $NS1 ping -W 1 -c 2 10.2.21.200

#Ping the bridge on "Ubuntu2" server
sudo ip netns exec $NS1 ping -W 1 -c 2 172.16.1.1

#Ping the first container on "Ubuntu2"
sudo ip netns exec $NS1 ping -W 1 -c 2 172.16.1.2

#Ping the second container on "Ubuntu2"
sudo ip netns exec $NS1 ping -W 1 -c 2 172.16.1.3