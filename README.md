# Image Creation for Virtual Machines

## Requirements

* vagrant >= 1.1.0  (vagrantup.com)
* packer >= 0.2 (packer.io)

## Boxes

### base

* german language and keyboard layout
* only minimal package set plus openssh
* users root and vagrant, both with password vagrant, (insecure) ssh-key is imported!!!!!
* passwordless sudo is enabled for vagrant user
* chef is installed by a tweaked scripts/chef.sh (vagrant-omnibus/chef-installer broken on wheezy: http://tickets.opscode.com/browse/CHEF-4125)


## Create Image

* install packer from http://packer.io
* do:
    $ packer validate template/debian/debian-7-amd64.json
    $ packer build template/debian/debian-7-amd64.json


## Adopt Definitions


*.json is the config for packer, consult packer documentation

http/preseed.cfg is used to automate the debian installer
scripts/* ... toBeContinued ....
