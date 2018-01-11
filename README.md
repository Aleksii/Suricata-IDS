# Suricata-IDS

Automate install Suricata


docker built -t suricata1 .

docker run --net=host -v /etc/suricata:/etc/suricata -v /var/log/suricata:/var/log/suricata -it suricata1 bash

