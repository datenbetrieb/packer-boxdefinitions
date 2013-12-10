# Update the box
#apt-get -y update
#apt-get -y install linux-headers-$(uname -r) build-essential
#apt-get -y install zlib1g-dev libssl-dev libreadline-gplv2-dev
#apt-get -y install curl unzip
#apt-get clean

apt-get -y update
apt-get -y upgrade
apt-get -y install curl
apt-get clean


# Tweak sshd to prevent DNS resolution (speed up logins)
#echo 'UseDNS no' >> /etc/ssh/sshd_config
