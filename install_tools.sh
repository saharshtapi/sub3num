#!/bin/bash
cur=$(pwd)
echo "[+]Installing Sublist3r"
if [ ! -d "tools" ];then
	mkdir tools
fi

cd tools
git clone https://github.com/aboul3la/Sublist3r.git >/dev/null 2>&1
echo "[+]Getting update.."
sudo apt update 
sudo apt install python3 python3-pip -y 
echo "[+]Installing requirements"
pip3 install -r Sublist3r/requirements.txt 
##################

echo "[+]Installing findomain"
wget https://github.com/Edu4rdSHL/findomain/releases/latest/download/findomain-linux >/dev/null 2>&1
chmod +x findomain-linux
cp findomain-linux /usr/local/bin/ >/dev/null 2>&1

#######################
cd

# echo "[+]Installing golang.."
# bash install_go.sh >/dev/null 2>&1
################
cd 

echo "[+]Installing Assetfinder"
go get -u github.com/tomnomnom/assetfinder >/dev/null 2>&1
cd $HOME/go/src/github.com/tomnomnom/assetfinder/>/dev/null 2>&1
go build>/dev/null 2>&1
cp assetfinder /usr/local/bin >/dev/null 2>&1

#####################
cd

echo "[+]Installing subfinder"
go get -v -u github.com/projectdiscovery/subfinder/v2/cmd/subfinder 
cd $HOME/go/src/github.com/projectdiscovery/subfinder/v2/cmd/subfinder/>/dev/null 2>&1
go build >/dev/null 2>&1
cp subfinder /usr/local/bin >/dev/null 2>&1

############################
cd

echo "[+]Installing httprobe"
go get -u github.com/tomnomnom/httprobe >/dev/null 2>&1
cd $HOME/go/src/github.com/tomnomnom/httprobe/ >/dev/null 2>&1
go build >/dev/null 2>&1
cp httprobe /usr/local/bin >/dev/null 2>&1
################################
cd 

echo "[+]Installing Amass (Might take some time).."
#go get -v -u github.com/OWASP/Amass/cmd/amass 
go get -v github.com/OWASP/Amass/v3/... 
cd $HOME/go/src/github.com/OWASP/Amass/cmd/amass>/dev/null 2>&1
go build >/dev/null 2>&1
cp amass /usr/local/bin >/dev/null 2>&1

###########################
cd 
echo "[+]Installing Subjack"
go get github.com/haccer/subjack

#########################
cd
echo "[+]Installing Subtake"
go get github.com/jakejarvis/subtake



echo "[🥂]Instalation Completed!!"
