#This script was written by Theory5
#It is intended to be used for the program virt-install, which is for building Virtual Machines on a headless system
#This script will walk you through creating a virtual disk, specifying an iso, and setting up the preferences for that machine
#Use at your own risk


#!/bin/bash


#COmmand for Dev purposes
#sudo virt-install --connect qemu:///system -n vm10 -r 512 --vcpus=2 --disk path=/var/lib/libvirt/images/vm10.img,size=12 -c /dev/cdrom --vnc --noautoconsole --os-type linux --accelerate --network=bridge:br0 --hvm 

#until loop to ensure all variables have values entered


#ask for name
read -p "Please specify name of VM being created:" VAR1
  until [ -n "${VAR1}" ]; do read -p "Please enter a name:" VAR1; done

read -p "Please specify the amount of RAM you wish to allocate to your VM (In MB's):" VAR2
  until [ -n "${VAR2}" ]; do read -p "Please enter a number:" VAR2; done

read -p "For all intents and purposes, this script will pretend you can spare 2 cores."

read -p  "Also, this script will create a virtual hard drive in /var/lib/libvirt/images/${VAR1}.img"

read -p "Please specify the size of disk ${VAR1} in Gigabytes:" VAR3
  until [ -n "${VAR3}" ]; do read -p "Please enter a number:" VAR3; done

read -p "Here is a list of all .iso files within the /home/ directory for memory purposes."

updatedb

locate *.iso

read -p "Please specify a CD or ISO location:" VAR4
  until [ -n "${VAR4}" ]; do read -p "Please enter a location:" VAR4; done

#read -p "This script is specifying the graphical option "--vnc" which means it opens a VNC server on the first free port 5900 or above" [ENTER] 


read -p "Please enter the OS type:" VAR7
  until [ -n "${VAR7}" ]; do read -p "Please enter on OS type:" VAR7; done

read -p "Please enter the virtual network bridge:" VAR8
  until [ -n "${VAR8}" ]; do read -p "Please enter the name of the bridge:" VAR8; done

#--hvm is for overriding the default virtualization choice. This requests full virtualization. DONT ATTEMPT TO USE GUESTS WITH CUCKOO IF THIS OPTION IS REMOVED!!!!
sudo virt-install --connect qemu:///system -n ${VAR1} -r ${VAR2} --vcpus=2 --disk path=/var/lib/libvirt/images/${VAR1}.img,size=${VAR3} \
-c ${VAR4} --vnc --noautoconsole --os-type ${VAR7} --accelerate --network=${VAR8} --hvm 

