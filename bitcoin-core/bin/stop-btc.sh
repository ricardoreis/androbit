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

stop_bitcoin_core() {
    if [ -f $BLOCKCHAIN_FOLDER//bitcoind.pid ]; then
        print_info "\nStopping Bitcoin Core.."
        ./stop.sh

        timer=0
        until [ ! -f $BLOCKCHAIN_FOLDER/bitcoind.pid ] || [ $timer -eq 120 ]; do
            timer=$((timer + 1))
            sleep $timer
        done

        if [ ! -f $BLOCKCHAIN_FOLDER/bitcoind.pid ]; then
            print_success "Bitcoin Core stopped."
        else
            print_error "Failed to stop Bitcoin Core."
            print_warning "\nUse the command below to check the debug.log file.\n"
	        echo "	   ~/bitcoin-core/bin/debug.sh\n"
            exit 1
        fi
    else
	print_warning "Failed to stop Bitcoin Core."
	print_warning "\nUse the command below to check the debug.log file.\n"
	echo "	   ~/bitcoin-core/bin/debug.sh\n"
    fi
}

stop_bitcoin_core