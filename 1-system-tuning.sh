#!/bin/bash

# This script configures system parameters for Solana Validator

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

# Prompting the user to log out and log in again for changes to take effect
echo "Please log out and log in again for the changes to take effect."

# Checking system clock accuracy
timedatectl
