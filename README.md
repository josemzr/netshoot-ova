# This repository is now archived and it has been superseded by Netshoot Virtual Appliance, a newer and better OVA based around Debian (https://github.com/josemzr/netshoot-virtual-appliance)


# Netshoot-OVA
This is a template to have the great Netshoot project by Nicolaka (https://github.com/nicolaka/netshoot) in an OVA format. It is very useful for those situations when you require a light and fast to deploy VM to troubleshoot a faulty network or VM environment, but don't want to install a full VM. Currently, the OVA is under 600MB.

The OVA is based around Alpine Linux 3.12 and can be built using [Packer](https://www.packer.io). The following Packer templates will build an OVA using either VirtualBox, VMware Workstation/Fusion/Player or a VMware vSphere ESXi host from an Alpine ISO image. Networking is configured for DHCP and an SSH user is created (default `vagrant` password `vagrant`) with sudo privileges. The default `root` password is `VMware1!`

---

To build it using **VirtualBox**, use the following command:

`packer build netshoot-ova-virtualbox.json`

---

To build it using **VMware Workstation/Fusion/Player**, use the following command:

`packer build netshoot-ova-vmware.json`

*Please note that the VMware-ISO builder does not allow OVF/OVA exporting from VMware Workstation/Fusion/Player. You'll have to export the VM manually after Packer has finished.*

---

Building it using a **VMware vSphere ESXi host** *(!) requires the additional installation of the [Open Virtualization Format Tool (ovftool)](https://code.vmware.com/web/tool/4.4.0/ovf) and the use of a Packer Variable file (`-var-file=builder-host.json`). Specify your *Builder-Host* parameters in the `builder-host.json` and execute the following command:

`packer build -var-file=builder-host.json netshoot-ova-esxi.json`

*: Only the VMware vSphere ESXi versions 6.5 and 6.7 are supported due to the [removal of the `VNC Server` in vSphere 7.0](https://docs.vmware.com/en/VMware-vSphere/7.0/rn/vsphere-esxi-vcenter-server-70-release-notes.html).

---

You can customize the login username and password with:

`packer build -var=ssh_username=youruser -var=ssh_password=yourpassword`

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
