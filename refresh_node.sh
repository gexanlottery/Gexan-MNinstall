#!/bin/bash
clear

gex-cli stop

sleep 10

rm -rf ~/.Gexan/blocks
rm -rf ~/.Gexan/database
rm -rf ~/.Gexan/chainstate
rm -rf ~/.Gexan/peers.dat

cp ~/.Gexan/Gexan.conf ~/.Gexan/Gexan.conf.backup
sed -i '/^addnode/d' ~/.Gexan/Gexan.conf
cat <<EOL >>  ~/.Gexan/Gexan.conf
EOL

gexd
