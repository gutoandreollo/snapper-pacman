#!/bin/bash

# Creates a post-transaction snapshot with snapper
# This script is needed since pacman hooks really can't pass 
# information from the beginning to the end of the transaction

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
