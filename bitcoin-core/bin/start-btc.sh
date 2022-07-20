#!/bin/sh
BLOCKCHAIN_FOLDER=$(find /storage -type d -name "com.termux" 2>/dev/null)/files/blockchain
#echo $BLOCKCHAIN_FOLDER
BLUE='\033[94m'
GREEN='\033[32;1m'
YELLOW='\033[33;1m'
RED='\033[91;1m'
RESET='\033[0m'

print_info() {
    printf "$BLUE$1$RESET\n"
}

print_success() {
    printf "$GREEN$1$RESET\n"
    sleep 1
}

print_warning() {
    printf "$YELLOW$1$RESET\n"
}

print_error() {
    printf "$RED$1$RESET\n"
    sleep 1
}

start_bitcoin_core() {
    if [ ! -f $BLOCKCHAIN_FOLDER/bitcoind.pid ]; then
        #print_info "\n\nStarting Bitcoin Core..."
        if [ -f /root/bitcoin-core/bin/bitcoind ]; then
            /root/bitcoin-core/bin/bitcoind -conf=$BLOCKCHAIN_FOLDER/bitcoin.conf -datadir=$BLOCKCHAIN_FOLDER -daemon
            echo ""
        fi
        
        #$HOME/bitcoin-core/bin/start.sh

        timer=0
        until [ -f $BLOCKCHAIN_FOLDER/bitcoind.pid ] || [ $timer -eq 5 ]; do
            timer=$((timer + 1))
            sleep $timer
        done

        if [ -f $BLOCKCHAIN_FOLDER/bitcoind.pid ]; then
            print_warning "\n\nBlockchain files folder:"
            echo "  $BLOCKCHAIN_FOLDER"
	    print_warning "\nUse the command below to check the debug.log file."
            echo "  ~/bitcoin-core/bin/debug.sh\n"
            print_success "\n\nOK! Bitcoin Core is running!"
        else
            print_error "Failed to start Bitcoin Core."
            exit 1
        fi
    else
	print_warning "\nBitcoin Core is probably already running."
	print_warning "\nUse the command below to check the debug.log file.\n"
	echo "	   ~/bitcoin-core/bin/debug.sh\n"
    fi
}

start_bitcoin_core
