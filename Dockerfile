FROM ubuntu

RUN apt-get update -y && apt-get install --assume-yes apt-utils  

RUN  apt-get install libpcre3-dbg libpcre3-dev autoconf automake libtool libpcap-dev libnet1-dev libyaml-dev zlib1g-dev libcap-ng-dev libmagic-dev libjansson-dev libjansson4 wget nano$

RUN  apt-get install libnetfilter-queue-dev libnetfilter-queue1 libnfnetlink-dev -y

RUN wget https://www.openinfosecfoundation.org/download/suricata-3.1.2.tar.gz && tar -xvf suricata-3.1.2.tar.gz && cd suricata-3.1.2 &&  ./configure --enable-nfqueue --prefix=/usr --s$

RUN apt install net-tools  ethtool -y

RUN apt install unzip git  -y

RUN echo 'alert icmp any any -> $HOME_NET any (msg:"PING ATTACK"; sid:10000001; rev:001;)' >>  /etc/suricata/rules/tls-events.rules

#RUN ethtool -K eth0 gro off lro off

RUN /usr/bin/suricata --list-runmodes

RUN /usr/bin/suricata -V


VOLUME ["/etc/suricata/"]
VOLUME ["/var/log/suricata"]

RUN git clone https://github.com/Aleksii/Suricata-IDS.git && cd Suricata-IDS && unzip -d /etc/suricata  suricata_conf.zip && unzip -d /var/log.suricata  suricata_log.zip


COPY ./start.sh /root/start.sh

RUN ["chmod", "777", "/root/start.sh"]

ENTRYPOINT ["/root/start.sh"]
