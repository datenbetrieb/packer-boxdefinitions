#!/bin/sh
wget https://downloads-packages.s3.amazonaws.com/debian-7.6/gitlab_7.4.3-omnibus.5.1.0.ci-1_amd64.deb
sudo apt-get install openssh-server -y
sudo apt-get install postfix -y # Select 'Internet Site', using sendmail instead also works, exim has problems
sudo dpkg -i gitlab_7.4.3-omnibus.5.1.0.ci-1_amd64.deb -y
