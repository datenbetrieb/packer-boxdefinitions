# adding insecure public vagrant ssh key to authorized keys

# user/password of vagrant has been created during installation (preseeding) 

# Install vagrant keys
# @todo: integrate some more security by adding some other keys
mkdir -pm 700 /home/vagrant/.ssh
curl -Lo /home/vagrant/.ssh/authorized_keys \
  'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub'
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh
