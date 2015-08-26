# Image Creation for Virtual Machines

* this definition creates a virtualbox machine with a pre-installed and fundamental configured debian 8 amd64.

## Requirements

* vagrant >= 1.1.0  (vagrantup.com)
* packer >= 0.2 (packer.io)

## Boxes

### debian 8 (jessie)

* only minimal package set plus openssh, git and chef(optional).
* users root and vagrant, both with password vagrant, (insecure) ssh-key is imported!!!!!
* passwordless sudo is enabled for vagrant user
* for virtualbox the specific guest-tools will be installed


## Create Image

* install packer from http://packer.io
* do:
    ```
    packer validate template/debian/debian.json
    ```
    ```
    packer build template/debian/debian.json
    ```
* wait until your machine is ready for "vagrant up"
* add the builded box from output dir to vagrant with:
    $ vagrant box add yourBoxName ./output/virtualbox/yourBoxName.box
* AND its done!


## Adopt Definitions

* *.json is the config for packer, consult packer documentation
* http/preseed.cfg is used to automate the debian installer
* scripts/* includes a bunch of shell scripts to on/off install packages, add users etc.. Use it to do only the absolutly basic things. all other configurations should be done by other provisioners like chef or ansible.

## Todo

* make http(preseed.cfg) relative to template. at the moment the http dir has to be relativ to the packer command
  -> https://github.com/mitchellh/packer/issues/193
  -> solved by https://github.com/mitchellh/packer/pull/2151 but not implemented yet

* add other users and ssh-keys
