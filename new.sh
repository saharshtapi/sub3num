#!/bin/bash	
url=$1
if [ ! -d "$url" ];then
	mkdir $url
fi
if [ ! -d "$url/subdomanins" ];then
	mkdir $url/subdomanins
fi



#####################################################################
echo "[🚀] Finding Subdomains..."
cd $url/subdomanins

#Assetfinder
touch assetfinder.txt
assetfinder $url >> assetfinder.txt
cat assetfinder.txt | grep $1 >> assetfinder.txt
echo "[✔️]Assetfinder DONE! - $(wc -l assetfinder.txt|cut -f 1 -d " ") Domains"

#findomain
findomain-linux -t $url -o >/dev/null
mv $url.txt findomain.txt
echo "[✔️]findomain DONE! - $(wc -l findomain.txt|cut -f 1 -d " ") Domains"

#subfinder
touch subfinder.txt
subfinder -d $url -o subfinder.txt >/dev/null 2>&1
echo "[✔️]subfinder DONE! - $(wc -l subfinder.txt|cut -f 1 -d " ") Domains"

#sublist3r
touch sublister.txt
python3  /home/tapi/tools/Sublist3r/sublist3r.py -d $url -o sublister.txt >/dev/null 2>&1
echo "[✔️]sublist3r DONE! - $(wc -l sublister.txt|cut -f 1 -d " ") Domains"

echo "[🥂]Subdomain Enum Completed !!!"
##########################################################################

echo "[📝]Merge and Sort"
touch merged
cat *.txt >merged
touch unique
sort -u merged >> unique

echo "[🏁]Final Alive Check.."
touch final
cat unique | sort -u|httprobe -s -p https:443| sed 's/https\?:\/\///' | tr -d ':443' > final
echo -n -e "\e[1;36m All Subdomains are stored in: $(pwd)/final\e[0m"
echo -n -e "\e[1;32m - [$(wc -l final |cut -f 1 -d " ") Domains]\e[0m"
echo " "

#############################################################################

