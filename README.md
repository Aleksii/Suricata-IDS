# Suricata-IDS

Automate install Suricata


docker built -t suricata1 .

docker run --net=host -v /etc/suricata:/etc/suricata -v /var/log/suricata:/var/log/suricata -it suricata1 bash





docker built -t suricata1 .    (Build image)felesfi
docker run --net=host -it suricata1 bash (Create docker and bash connect)
docker run --net=host -v /etc/suricata:/etc/suricata -it suricata1 bash
docker run --net=host -v /etc/suricata:/etc/suricata -v /var/log/suricata:/var/log/suricata -it suricata1 bash


nano /etc/suricata/suricata.yaml (input IP address) 
/usr/bin/suricata -c /etc/suricata/suricata.yaml -i eth0 --init-errors-fatal & (Start suricata)
 
