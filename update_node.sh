#!/bin/bash

TARBALLURL="https://github.com/gexanlottery/gexan/releases/download/v2.0.3.2/ubuntu16.04-daemon.zip"
TARBALLNAME="ubuntu16.04-daemon.zip"
GEXVERSION="2.0.3.2"

clear
echo "This script will update your masternode to version 2.0.3.2"
read -p "Press Ctrl-C to abort or any other key to continue. " -n1 -s
clear
echo "Please enter your password to enter administrator mode:"
sudo true
echo "Shutting down masternode..."
gex-cli stop
echo "Installing Gexan 2.0.3.2"
mkdir ./gex-temp && cd ./gex-temp
wget $TARBALLURL
unzip $TARBALLNAME
sudo rm $TARBALLNAME
yes | sudo cp -rf gexd /usr/local/bin
yes | sudo cp -rf gex-cli /usr/local/bin
sudo chmod +x /usr/local/bin/gexd
sudo chmod +x /usr/local/bin/gex-cli
cd ..
sed -i '/^addnode/d' ~/.gex/gex.conf
cat <<EOL >>  ~/.Gexan/Gexan.conf
EOL
echo "Restarting Gexan daemon..."
gexd -reindex
clear
read -p "Please wait at least 5 minutes for the wallet to load, then press any key to continue." -n1 -s
clear
echo "Starting masternode..." # TODO: Need to wait for wallet to load before starting...
gex-cli masternode status
