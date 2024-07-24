sudo apt -y update
sudo apt -y upgrade

#---------Install Python3---------#
sudo apt install python3
sudo apt install -y python3-pip
sudo apt install pipx
pipx ensurepath

#---------Install Golang---------#
echo "Golang environment installation in progress ...";
cd /tmp && wget https://go.dev/dl/go1.22.2.linux-amd64.tar.gz && tar xvf go1.22.2.linux-amd64.tar.gz;
mv go /usr/local
export GOROOT=/usr/local/go && export GOPATH=$HOME/go && export PATH=$GOPATH/bin:$GOROOT/bin:$PATH;
echo 'export GOROOT=/usr/local/go' >> ~/.profile && echo 'export GOPATH=$HOME/go' >> ~/.profile && echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.profile;
source ~/.profile
echo "Golang environment installation is done!";
sleep 1.5

#-------------Tools------------#
sudo apt install -y build-essential
sudo apt install -y libpcap-dev

#---------naabu---------#
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
ln -s ~/go/bin/naabu /usr/local/bin/;
echo "Done! naabu installed.";
sleep 1.5

#---------Subfinder---------#
echo "Installing Subfinder";
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
ln -s ~/go/bin/subfinder /usr/local/bin/;
echo "Done! Subfinder installed.";
sleep 1.5

#---------Install Fuzzing Tools---------#
echo "Installing ffuf";
go install github.com/ffuf/ffuf/v2@latest
ln -s ~/go/bin/ffuf /usr/local/bin/;
echo "Done! Ffuf installed.";
sleep 1.5

#---------SQLmap---------#
echo "Installing sqlmap";
apt install -y sqlmap;
echo "Done! Sqlmap installed."; echo "";
sleep 1.5

#---------nuclei---------#
echo "Installing nuclei";
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
ln -s ~/go/bin/nuclei /usr/local/bin/;
echo "Done! nuclei installed.";
sleep 1.5

#---------Http Probe---------#
echo "Installing httprobe";
go install -v github.com/tomnomnom/httprobe@latest && ln -s ~/go/bin/httprobe /usr/local/bin/;
echo "Done! Httprobe installed.";
sleep 1.5

#---------httpx---------#
echo "Installing httpx";
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest && ln -s ~/go/bin/httpx /usr/local/bin/;
echo "Done! Httpx installed.";
sleep 1.5

#---------waybackurls---------#
echo "Installing waybackurls";
go install github.com/tomnomnom/waybackurls@latest && ln -s ~/go/bin/waybackurls /usr/local/bin/;
echo "Done! Waybackurls installed.";
sleep 1.5

#---------amass---------#
echo "Installing amass";
go install github.com/owasp-amass/amass/v4/...@master && ln -s ~/go/bin/amass /usr/local/bin/;
echo "Done! amass installed.";
sleep 1.5

#---------waymore---------#
echo "Installing waymore";
pipx install git+https://github.com/xnl-h4ck3r/waymore.git
echo "Done! waymore installed. You would need to open a new terminal";
sleep 1.5
