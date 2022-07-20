# androbit
Bitcoin Node Android
     
 This is the install script for Bitcoin full node based on Bitcoin Core.

 This script attempts to make your node automatically reachable by other nodes
 in the network. This is done by using uPnP to open port 8333 on your router
 to accept incoming connections to port 8333 and route the connections to your
 node running inside your local network.

 For security reason, wallet functionality is not enabled by default.

 Usage:
 
 1 - Install Termux App
 
 2 - Install Ubuntu on Termux
 
 3 - Install Bitcoin Core on Ubuntu
 
   Open your terminal and type:
     apt-get update && apt-get upgrade -y && apt install curl -y && curl https://raw.githubusercontent.com/ricardoreis/androbit/master/install-full-node-android-external-drive.sh | sh

 Bitcoin Core will be installed using binaries provided by bitcoin.org.

Binaries files will be installed into $HOME/bitcoin-core/bin directory 
and Blockchain data files will be isntalled on your external drive.

Layout of this  directory after the installation is shown below:

Source files:
   $HOME/bitcoin-core/bitcoin/

Binaries:
   $HOME/bitcoin-core/bin/

Configuration file:
   $HOME/bitcoin-core/.bitcoin/bitcoin.conf

Blockchain data files:
   $HOME/bitcoin-core/.bitcoin/blocks
   $HOME/bitcoin-core/.bitcoin/chainstate
