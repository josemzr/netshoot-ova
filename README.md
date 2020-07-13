# Netshoot-OVA
This is a template to have the great Netshoot project by Nicolaka (https://github.com/nicolaka/netshoot) in an OVA format. It is very useful for those situations when you require a light and fast to deploy VM to troubleshoot a faulty network or VM environment, but don't want to install a full VM. Currently, the OVA is under 600MB.

The OVA is based around Alpine Linux 3.12 and can be built using [Packer](https://www.packer.io).  This Packer template will build a OVA using VirtualBox or VMware Workstation/Fusion/Player from an Alpine ISO image. Networking is configured for DHCP and an SSH user is created (default `vagrant` password `vagrant`) with sudo privileges. The default `root` password is `VMware1!`


To build it using VirtualBox, use the following command

    packer build netshoot-ova-virtualbox.json

To build it using VMware, use the following command

    packer build netshoot-ova-vmware.json
    
*Please note that the VMware-ISO builder does not allow OVF/OVA exporting from VMware Workstation/Fusion/Player. You'll have to export the VM manually after Packer has finished.*
    

You can customize the login username and password with:

    packer build -var=ssh_username=youruser -var=ssh_password=yourpassword

Further customization is possible by overriding other variables, or editing `netshoot-ova` or `http/answers`.

**Included Packages:**

The following packages are included in Netshoot-OVA:

    docker
    kubectl
    apache2-utils
    bash
    bind-tools
    bird
    bridge-utils
    busybox-extras
    calicoctl
    conntrack-tools
    ctop
    curl
    dhcping
    drill
    ethtool
    file
    fping
    httpie
    iftop
    iperf
    iproute2
    ipset
    iptables
    iptraf-ng
    iputils
    ipvsadm
    jq
    libc6-compat
    liboping
    mtr
    net-snmp-tools
    netcat-openbsd
    netgen
    nftables
    ngrep
    nmap
    nmap-nping
    openssl
    py-crypto
    py2-virtualenv
    python2
    scapy
    socat
    strace
    tcpdump
    tcptraceroute
    termshark
    tshark
    util-linux
    vim


**Acknowledgements**

This project is possible because of the great work done in the [Packer-Alpine] (https://github.com/bobfraser1/packer-alpine) project and the amazing [Netshoot] (https://github.com/nicolaka/netshoot) by Nicolaka.
