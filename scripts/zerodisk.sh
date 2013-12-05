# Zero out the free space to save space in the final image:
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
echo 'sync and sleep for 5s, fixes problem on shutdown, see https://github.com/mitchellh/packer/issues/57'
sync
sleep 5s
