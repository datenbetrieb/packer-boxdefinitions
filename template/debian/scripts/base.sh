apt-get -y update
apt-get -y upgrade
apt-get -y install curl vim git
apt-get clean


# Tweak sshd to prevent DNS resolution (speed up logins)
#echo 'UseDNS no' >> /etc/ssh/sshd_config
