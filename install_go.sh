#!/bin/bash

echo "[+] Installing Go..."
cd 
curl -O https://dl.google.com/go/go1.15.1.linux-amd64.tar.gz
curl -O https://dl.google.com/go/go1.15.1.linux-amd64.tar.gz
sudo chown -R root:root /usr/local/go
mkdir -p $HOME/go/{bin,src}
echo 'export GOPATH=$HOME/go' >> ~/.profile
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.profile
echo 'export GOPATH=$HOME/go' >> ~/.profile
source ~/.profile
go version
echo '[+]if above output is go1.15.1 linux/amd64 then GO installed succesfully!!!'
