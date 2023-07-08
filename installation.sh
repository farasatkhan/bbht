sudo apt -y update
sudo apt -y upgrade

# bunch of new packages including gcc, g++ and make.
sudo apt install build-essential

#---------Install Python
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install -y python3.11
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.11 1
sudo apt install -y python3.11-dev python3.11-venv python3.11-distutils python3.11-gdbm python3.11-tk python3.11-lib2to3
sudo apt install -y python3-pip
sudo apt install -y python3-requests python3-dnspython python-argparse

#---------Install Golang
echo "Golang environment installation in progress ...";
cd /tmp && wget https://go.dev/dl/go1.20.5.linux-amd64.tar.gz && tar xvf go1.20.5.linux-amd64.tar.gz;
mv go /usr/local
export GOROOT=/usr/local/go && export GOPATH=$HOME/go && export PATH=$GOPATH/bin:$GOROOT/bin:$PATH;
echo 'export GOROOT=/usr/local/go' >> ~/.profile && echo 'export GOPATH=$HOME/go' >> ~/.profile && echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.profile;
source ~/.profile
echo "Golang environment installation is done!";
sleep 1.5

#---------Create a Tools folder in Home
echo "Create a Tools folder";
mkdir /home/tools
cd /home/tools/
echo "Done!";
sleep 1.5

#---------Install Network scanner
#Nmap
echo "Installing nmap";
apt install -y nmap;
echo "Done! Nmap installed.";
sleep 1.5

#---------Install subdomain enumeration and DNS Resolver
#dnsutils
apt install -y dnsutils;
sleep 1.5

#Massdns
echo "Installing massdns";
git clone https://github.com/blechschmidt/massdns.git;
cd /home/tools/massdns
make;
export PATH="$PATH:/home/tools/massdns/bin"
echo "Massdns installed.";
sleep 1.5

#Subfinder
echo "Installing Subfinder";
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
ln -s ~/go/bin/subfinder /usr/local/bin/;
echo "Done! Subfinder installed.";
sleep 1.5

#Sublist3r
echo "Installing Sublist3r";
cd /home/tools/
git clone https://github.com/aboul3la/Sublist3r.git;
cd Sublist3r
cd /home/tools/
echo "Done! Sublist3r installed."; echo "";
sleep 1.5

#Assetfinder
echo "Installing Assentfinder";
go install -v github.com/tomnomnom/assetfinder@latest
ln -s ~/go/bin/assetfinder /usr/local/bin/;
echo "Done! Assetfinder installed."; echo "";
sleep 1.5

#---------Install Fuzzing Tools
#ffuf
echo "Installing ffuf";
go install github.com/ffuf/ffuf/v2@latest
ln -s ~/go/bin/ffuf /usr/local/bin/;
echo "Done! Ffuf installed.";
sleep 1.5

#---------Wordlists
#install Seclists
echo "Downloading Seclists";
cd /home/tools/
git clone https://github.com/danielmiessler/SecLists.git;
cd /home/tools/SecLists/Discovery/DNS/
#This file must be cleaned, as it breaks massdns
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
rm dns-Jhaddix.txt
cd /home/tools/
echo "Done! Seclists downloaded.";
sleep 1.5

#install JHaddix Wordlist
echo "downloading JHaddix wordlist"
mkdir /home/tools/custom_wordlist
cd /home/tools/custom_wordlist
wget https://gist.githubusercontent.com/jhaddix/b80ea67d85c13206125806f0828f4d10/raw/c81a34fe84731430741e0463eb6076129c20c4c0/content_discovery_all.txt
echo "Done! JHaddix wordlist downloaded.";
sleep 1.5

#install Nahamsec list
echo "downloading Nahamsec list"
cd /home/tools/custom_wordlist
wget https://gist.githubusercontent.com/Leoid/38984017886cd058a314dfda5c3d6c6e/raw/1ee5fe1da82a3ae92b0c486f86fbe26bbdff1e06/Nahamsec%2520Thread
mv 'Nahamsec Thread' nahamsec_discovery_list.txt
echo "Done! Nahamsec list downloaded.";


#---------Vuln SQL
#SQLmap
echo "Installing sqlmap";
apt install -y sqlmap;
echo "Done! Sqlmap installed."; echo "";
sleep 1.5

#---------nuclei
echo "Installing nuclei";
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest;
ln -s ~/go/bin/nuclei /usr/local/bin/;
echo "Done! nuclei installed.";
sleep 1.5

#---------Useful Tools
#anew
echo "Installing Anew";
go install -v github.com/tomnomnom/anew@latest && ln -s ~/go/bin/anew /usr/local/bin/;
echo "Done! Dnsgen installed.";
sleep 1.5

#unew
echo "Installing Unew";
go install -v github.com/dwisiswant0/unew@latest && ln -s ~/go/bin/unew /usr/local/bin/;
echo "Done! Dnsgen installed.";
sleep 1.5

#gf
echo "Installing gf";
go install -v github.com/tomnomnom/gf@latest && ln -s ~/go/bin/gf /usr/local/bin/;
echo "Done! Gf installed.";
sleep 1.5

#Http Probe
echo "Installing httprobe";
go install -v github.com/tomnomnom/httprobe@latest && ln -s ~/go/bin/httprobe /usr/local/bin/;
cd /home/tools/
echo "Done! Httprobe installed.";
sleep 1.5

#httpx
echo "Installing httpx";
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest && ln -s ~/go/bin/httpx /usr/local/bin/;
cd /home/tools/
echo "Done! Httpx installed.";
sleep 1.5

#waybackurls
echo "Installing waybackurls";
go install github.com/tomnomnom/waybackurls@latest && ln -s ~/go/bin/waybackurls /usr/local/bin/;
cd /home/tools/
echo "Done! Waybackurls installed.";
sleep 1.5

#Arjun
echo "Installing arjun";
pip3 install arjun;
echo "Done! Arjun installed.";
sleep 1.5

#Gau
echo "Installing gau";
go install github.com/lc/gau/v2/cmd/gau@latest && ln -s ~/go/bin/gau /usr/local/bin/;
cd ~/tools/
echo "Done! Gau installed.";
sleep 1.5

#Waymore
cd /home/tools/
git clone https://github.com/xnl-h4ck3r/waymore.git
cd waymore
pip3 install -r requirements.txt
sudo python setup.py install

#Http amass
echo "Installing amass";
go install -v github.com/owasp-amass/amass/v3/...@master && ln -s ~/go/bin/amass /usr/local/bin/;
cd /home/tools/
echo "Done! amass installed.";
sleep 1.5

#Http interactsh
echo "Installing interactsh";
go install -v github.com/projectdiscovery/interactsh/cmd/interactsh-client@latest && ln -s ~/go/bin/interactsh-client /usr/local/bin/;
cd /home/tools/
echo "Done! interactsh installed.";
sleep 1.5

#Http meg
echo "Installing meg";
go install github.com/tomnomnom/meg@latest && ln -s ~/go/bin/meg /usr/local/bin/;
cd /home/tools/
echo "Done! meg installed.";
sleep 1.5