Suricata install 

Dockerfile

#!/bin/sh

#update ssystem
sudo apt-get update -y

#Run the following command to install all the dependencies:

sudo apt-get install libpcre3-dbg libpcre3-dev autoconf automake libtool libpcap-dev libnet1-dev libyaml-dev zlib1g-dev libcap-ng-dev libmagic-dev libjansson-dev libjansson4

#By default, Suricata works as an Intrusion Detection System, if you want to use it as a Intrusion Detection System and Intrusion Prevention System, you also need to install som$

sudo apt-get install libnetfilter-queue-dev libnetfilter-queue1 libnfnetlink-dev

#Installing Suricata

wget https://www.openinfosecfoundation.org/download/suricata-3.1.2.tar.gz
tar -xvf suricata-3.1.2.tar.gz
cd suricata-3.1.2 ls
sudo ./configure --enable-nfqueue --prefix=/usr --sysconfdir=/etc --localstatedir=/var
sudo make
sudo make install
sudo make install-conf
sudo make install-rules

#cd /etc/suricata/rules ls


# Install local ip as HOME_NET

newip=$(ifconfig enp0s5 | grep "inet addr" | cut -d ':' -f 2 | cut -d ' ' -f 1)
echo $newip
sed -i "s/[192.168.0.0/16,10.0.0.0/8,172.16.0.0/12]/$newip/g" /etc/suricata/suricata.yaml

#Perform Intrusion Detection

sudo ethtool -K eth0 gro off lro off
sudo /usr/bin/suricata --list-runmodes

Finish command in other cli input:

/usr/bin/suricata", "-c", "/etc/suricata/suricata.yaml", "-i", "enp0s5", "--init-errors-fatal
