#!/bin/bash

# Creates a pre-transaction snapshot with snapper
# This script is needed since pacman hooks really can't pass 
# information from the beginning to the end of the transaction

# If you're here because your transaction is being aborted due to 
# errors on taking the snapshot, you either want to edit the
# hook file on /usr/share/libalpm/snapper*.hook , or if you're 
# just feeling lazy, change the last line in this file into "exit 0"

# BEWARE that doing this might kill you with the very weapon you're
# trying to use to protect yourself. You've been warned.

echo "$*" >> /tmp/log

snapper create --type pre \
    --description "Pacman Hook pre-transaction snapshot: $*" \
    --cleanup timeline \
    --print-number > /var/tmp/snapper-pacman.snapshot                                                                                   
exit $?
