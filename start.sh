#!/bin/sh

BLOCKCHAIN_FOLDER=$(find /storage -type d -name "com.termux" 2>/dev/null)/files/blockchain
echo $BLOCKCHAIN_FOLDER

if [ -f /root/bitcoin-core/bin/bitcoind ]; then
    /root/bitcoin-core/bin/bitcoind -conf=$BLOCKCHAIN_FOLDER/bitcoin.conf -datadir=$BLOCKCHAIN_FOLDER -daemon
fi
