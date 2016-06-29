#!/bin/bash

# Creates a pre-transaction snapshot with snapper
# This script is needed since pacman hooks really can't pass 
# information from the beginning to the end of the transaction

echo "$*" >> /tmp/log

snapper create --type pre \
    --description "Pacman Hook pre-transaction snapshot: $*" \
    --cleanup timeline \
    --print-number > /var/tmp/snapper-pacman.snapshot                                                                                   
exit $?
