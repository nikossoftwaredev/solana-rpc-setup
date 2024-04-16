#!/bin/bash

# This script configures system parameters for Solana Validator

ulimit -n 65536

# Configuring system parameters
sudo bash -c 'cat > /etc/sysctl.d/21-solana-validator.conf <<EOF
# Increase UDP buffer sizes
net.core.rmem_default = 134217728
net.core.rmem_max = 134217728
net.core.wmem_default = 134217728
net.core.wmem_max = 134217728

# Increase memory mapped files limit
vm.max_map_count = 1000000

# Increase number of allowed open file descriptors
fs.nr_open = 1000000
EOF'

# Applying the sysctl changes
sudo sysctl -p /etc/sysctl.d/21-solana-validator.conf

# Adjusting systemd service file or /etc/systemd/system.conf
# Adjusting systemd service file if exists
if [ -f "/etc/systemd/system/solana-validator.service" ]; then
    sudo bash -c 'echo "LimitNOFILE=1000000" >> /etc/systemd/system/solana-validator.service'
    sudo systemctl daemon-reload
fi

# Adjusting /etc/systemd/system.conf
sudo bash -c 'echo "DefaultLimitNOFILE=1000000" >> /etc/systemd/system.conf'

# Creating a file to set process file descriptor count limit
sudo bash -c 'cat >/etc/security/limits.d/90-solana-nofiles.conf <<EOF
# Increase process file descriptor count limit
* - nofile 1000000
EOF'


# Flush existing rules
sudo iptables -F
# Define the list of UDP ports to be opened
udp_ports="8899 8900 8000 8001 8003 8004 8005 8006 8007 8008 8009 8010 8011 8012 8013 8014 8015 8016 8017 8018 8019 8020"

# Allow incoming UDP traffic on the specified ports
for port in $udp_ports; do
    sudo iptables -A INPUT -p udp --dport $port -j ACCEPT
    sudo iptables -A INPUT -p tcp --dport $port -j ACCEPT
done


if [ ! -d "/var/nikossoftwaredev" ]; then
    mkdir -p /var/nikossoftwaredev && mkdir /var/nikossoftwaredev/data && mkdir /var/nikossoftwaredev/accounts && mkdir /var/nikossoftwaredev/ledger
    chmod -R 777 /var/nikossoftwaredev
fi


