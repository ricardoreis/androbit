#!/bin/sh

BLOCKCHAIN_FOLDER=$(find /storage -type d -name "com.termux" 2>/dev/null)/files/blockchain
#echo $BLOCKCHAIN_FOLDER

tail -f $BLOCKCHAIN_FOLDER/debug.log
