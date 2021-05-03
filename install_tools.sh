#!/bin/bash

echo "[+] Installing Sublist3r"
cd 
mkdir tools
cd tools
git clone https://github.com/aboul3la/Sublist3r.git >/dev/null 2>&1
echo "[+]Getting update.."
sudo apt update 
sudo apt install python3 python3-pip >/dev/null 2>&1
sudo pip3 install -r requirements.txt >/dev/null 2>&1

##################
cd $HOME/tools
echo "[+]Installing findomain"
wget https://github.com/Edu4rdSHL/findomain/releases/latest/download/findomain-linux /dev/null 2>&1
chmod +x findomain-linux
cp findomain-linux /usr/local/bin

#######################
cd 

echo "[+]Installing golang.."
bash install_go.sh >/dev/null 2>&1
################
cd 

echo "[+]Installing Assetfinder"
go get -u github.com/tomnomnom/assetfinder >/dev/null 2>&1
cd $HOME/go/src/github.com/tomnomnom/assetfinder/
go build
cp assetfinder /usr/local/bin

#####################
cd

echo "[+]Installing subfinder"
go get -v -u github.com/projectdiscovery/subfinder/v2/cmd/subfinder >/dev/null 2>&1
cd $HOME/go/src/github.com/projectdiscovery/subfinder/v2/cmd/subfinder/
go build
cp subfinder /usr/local/bin

############################
cd

echo "[+]Installing httprobe"
go get -u github.com/tomnomnom/httprobe >/dev/null 2>&1
cd $HOME/go/src/github.com/tomnomnom/httprobe/
go build
cp httprobe /usr/local/bin

echo "[🥂]Instalation Completed!!"
