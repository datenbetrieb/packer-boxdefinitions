#!/bin/sh -eux

# Installing chef
case "${CHEF_INSTALLMETHOD}" in

  "manual")
    # in case of trouble with default installer use manual install method
    # @todo adapt to current state
    echo 'see http://tickets.opscode.com/browse/CHEF-4125'
    # manually force the debian version to 6
    tmp_dir=$(mktemp -d -t tmp.XXXXXXXX || echo "/tmp")
    filename="chef-debian-amd64.deb"
    wget -O $tmp_dir/$filename "https://www.opscode.com/chef/download?v=latest&p=debian&pv=6&m=x86_64"
    dpkg -i $tmp_dir/$filename
  ;;

  "default")
    if [ "${CHEF_VERSION}" == 'latest' ]; then
      echo "Installing latest Chef version"
      sh <(curl -L https://www.opscode.com/chef/install.sh)
    else
      echo "Installing Chef version ${CHEF_VERSION}"
      sh <(curl -L https://www.opscode.com/chef/install.sh) -v "${CHEF_VERSION}"
    fi
  ;;

  *)
    echo "Unsupported method ${CHEF_INSTALLMETHOD} for installing chef"
    exit -1
  ;;

esac
