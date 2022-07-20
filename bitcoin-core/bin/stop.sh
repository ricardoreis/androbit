#!/bin/sh

BLOCKCHAIN_FOLDER=$(find /storage -type d -name "com.termux" 2>/dev/null)/files/blockchain
#echo $BLOCKCHAIN_FOLDER

if [ -f $BLOCKCHAIN_FOLDER/bitcoind.pid ]; then
    kill $(cat $BLOCKCHAIN_FOLDER/bitcoind.pid)
fi
