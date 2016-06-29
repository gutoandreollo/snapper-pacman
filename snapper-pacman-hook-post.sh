#!/bin/bash

# Creates a post-transaction snapshot with snapper
# This script is needed since pacman hooks really can't pass 
# information from the beginning to the end of the transaction

# If you're here because your transaction is being aborted due to 
# errors on taking the snapshot, you either want to edit the
# hook file on /usr/share/libalpm/snapper*.hook , or if you're 
# just feeling lazy, change the 'exit ${RC}' line in this file into 'exit 0'

# BEWARE that doing this might kill you with the very weapon you're
# trying to use to protect yourself. You've been warned.

if [ -f /var/tmp/snapper-pacman.snapshot ] ; then
  snapper create --type post \
      --description "Pacman Hook post-transaction snapshot" \
      --cleanup empty-pre-post \
      --pre-number $(cat /var/tmp/snapper-pacman.snapshot)
  RC=$?
  # clean up the file
  rm -f /var/tmp/snapper-pacman.snapshot
  # exit with the same RC that snapper did
  exit ${RC}
else
  exit 1
fi
