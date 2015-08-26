#!/bin/sh
sudo apt-get install -y curl openssh-server ca-certificates postfix
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo apt-get install gitlab-ce
