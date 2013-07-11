# @todo turn into real config param?
CHEF_INSTALLMETHOD="omnibus"

# Default to Gem install
if [ -z "$CHEF_INSTALLMETHOD" ]; then
  export CHEF_INSTALLMETHOD="gems"
fi

# Installing chef
case $CHEF_INSTALLMETHOD in
  "gems")
    # Using gems
    if [ -z "$CHEF_VERSION" ]; then
      # Default to latest
      gem install chef --no-ri --no-rdoc
    else
      gem install chef --no-ri --no-rdoc --version $CHEF_VERSION
    fi
    ;;

  "omnibus")
    # Using omnibus
    if [ -z "$CHEF_VERSION" ]; then
      # Default to latest
     wget -0 "https://www.opscode.com/chef/download?v=latest&p=debian&pv=6&m=x86_64" | bash -s 
    else
      echo "broken chef install scripts/chef.sh"
      #wget -O - http://opscode.com/chef/install.sh | sudo bash -s -- -v $CHEF_VERSION
    fi
    ;;

  "package")
    # Using packages
    apt-get install -y debconf-utils
    echo "chef    chef/chef_server_url    string  $CHEF_SERVER_URL" | debconf-set-selections
    if [ -z "$CHEF_VERSION" ]; then
      # Default to latest
      apt-get install -y chef
    else
      apt-get install -y chef=$CHEF_VERSION
    fi
    ;;

  *)
    echo "Unsupported method for installing chef"
    exit -1
    ;;
esac
