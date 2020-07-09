echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories 
echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories 
echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories 
apk update 
apk upgrade 
apk add --no-cache apache2-utils bash bind-tools bird bridge-utils busybox-extras conntrack-tools curl dhcping drill ethtool file fping httpie iftop iperf iproute2 ipset iptables iptraf-ng iputils ipvsadm jq libc6-compat liboping mtr net-snmp-tools netcat-openbsd nftables ngrep nmap nmap-nping openssl scapy socat strace tcpdump tcptraceroute tshark util-linux kubectl vim 

# apparmor issue #14140
mv /usr/sbin/tcpdump /usr/bin/tcpdump

# Installing ctop - top-like container monitor
wget https://github.com/bcicen/ctop/releases/download/v0.7.1/ctop-0.7.1-linux-amd64 -O /usr/local/bin/ctop
chmod +x /usr/local/bin/ctop

# Installing calicoctl
CALICOCTL_VERSION=v3.13.3 
wget https://github.com/projectcalico/calicoctl/releases/download/${CALICOCTL_VERSION}/calicoctl 
chmod +x calicoctl 
mv calicoctl /usr/local/bin

# Installing termshark
TERMSHARK_VERSION=2.1.1 
wget https://github.com/gcla/termshark/releases/download/v${TERMSHARK_VERSION}/termshark_${TERMSHARK_VERSION}_linux_x64.tar.gz -O /tmp/termshark_${TERMSHARK_VERSION}_linux_x64.tar.gz
tar -zxvf /tmp/termshark_${TERMSHARK_VERSION}_linux_x64.tar.gz
mv termshark_${TERMSHARK_VERSION}_linux_x64/termshark /usr/local/bin/termshark
chmod +x /usr/local/bin/termshark

# Installing Docker

apk add docker
rc-update add docker
echo "cgroup  /sys/fs/cgroup  cgroup  defaults  0   0" >> /etc/fstab

