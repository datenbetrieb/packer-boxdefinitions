# Image Creation for Virtual Machines

* this definition creates a virtualbox machine with a pre-installed and fundamental configured debian 7.2 amd64.

## Requirements

* vagrant >= 1.1.0  (vagrantup.com)
* packer >= 0.2 (packer.io)

* a current debian iso
  if packer can not find the iso you have to look at the release database to find the current release. then you have to adapt the iso version and md5 hash.

## Boxes

### base

* german language and keyboard layout
* only minimal package set plus openssh, git and chef.
* users root and vagrant, both with password vagrant, (insecure) ssh-key is imported!!!!!
* passwordless sudo is enabled for vagrant user
* chef is installed by a tweaked scripts/chef.sh (vagrant-omnibus/chef-installer broken on wheezy: http://tickets.opscode.com/browse/CHEF-4125)
* for vmware and virtualbox the specific guest-tools will be installed


## Create Image

* install packer from http://packer.io
* do:
    ```
    packer validate template/debian/debian-7-amd64.json
    ```
    ```
    packer build template/debian/debian-7-amd64.json
    ```
* wait until your machine is ready for "vagrant up"
* add the builded box from output dir to vagrant with:
    $ vagrant box add yourBoxName ./output/virtualbox/yourBoxName.box
* AND its done!


## Adopt Definitions


*.json is the config for packer, consult packer documentation

http/preseed.cfg is used to automate the debian installer
scripts/* includes shell provisioner scripts
