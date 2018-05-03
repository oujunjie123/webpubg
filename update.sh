#!/bin/bash
echo "Welcome PUBG Web Radar A key installation"
echo "CE安全网"
echo "WwW.CeSaFe.CoM"
echo "Version 4.26-5.10"
echo "Ready?"
read -p "Enter Install"
echo "Please Your Intranet IP" 
read -p "Intranet IP： " ip
cp /root/pubgradar/restart.sh /root/restart.sh
chmod +x restart.sh
wget --no-check-certificate -O shadowsocks-all.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh
chmod +x shadowsocks-all.sh
./shadowsocks-all.sh 2>&1 | tee shadowsocks-all.log

echo "SS OK!，Remember relevant information"
read -p "OK? Enter!" 

curl https://raw.githubusercontent.com/creationix/nvm/v0.13.1/install.sh | bash
source ~/.bash_profile
nvm install v9.8.0
nvm alias default v9.8.0
yum -y install gcc-c++
yum -y install flex
yum -y install bison
wget http://www.tcpdump.org/release/libpcap-1.8.1.tar.gz
tar -zxvf libpcap-1.8.1.tar.gz
cd libpcap-1.8.1
./configure
make
make install

git clone https://github.com/hacklele/webpubg.git
cd pubgradar/
npm i
npm i -g pino
npm install -g forever
forever start index.js sniff eth0 $ip | pino

echo "PUBG Web Radar Build complete!"
echo "CE安全网"
echo "WwW.CeSaFe.CoM"
