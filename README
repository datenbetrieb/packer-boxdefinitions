Image Creation for Virtual Machines
====================================================

Requirements
----------------------------------------------------

vagrant >= 1.1.0  (vagrantup.com)
packer >= ??? (packer.io)

Boxes
----------------------------------------------------

base
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

german language and keyboard layout
only minimal package set plus openssh
chef => 11.x via omnibus install
users root and vagrant, both with password vagrant, (insecure) ssh-key is imported!!!!!
passwordless sudo is enabled for vagrant user

slim
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

testing
Download the file 'chef_11.4.4-2.debian.6.0.5_amd64.deb' into this directory as (automatic) installer is broken on wheezy ((see http://tickets.opscode.com/browse/CHEF-4125)


Create Image
----------------------------------------------------

#!/bin/sh
PACKERBIN=packer
#PACKERBIN=/opt/packer/packer

TEMPLATE=base
VERSION=01

# validate config and create the image
${PACKERBIN} validate ${TEMPLATE}.json
${PACHERBIN} build ${TEMPLATE}.json

#Add Image on your personal vagrant box shelf
BOXFILE="packer__virtualbox.box"
BOXNAME="debian-7-amd64-${TEMPLATE}-${VERSION}"
#vagrant box remove ${BOXNAME} virtualbox
#vagrant box add ${BOXNAME} $(BOXFILE}


Adopt Definitions
---------------------------------------------------


*.json is the config for packer, consult packer documentation

http/preseed.cfg is used to automate the debian installer
scripts/* ... toBeContinued ....
