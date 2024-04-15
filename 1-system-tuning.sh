#!/bin/bash

mkdir -p /etc/sysctl.d/

# Create a sysctl configuration file for Solana validator settings
echo "# Increase UDP buffer sizes" > /etc/sysctl.d/21-solana-validator.conf
echo "net.core.rmem_default = 134217728" >> /etc/sysctl.d/21-solana-validator.conf
echo "net.core.rmem_max = 134217728" >> /etc/sysctl.d/21-solana-validator.conf
echo "net.core.wmem_default = 134217728" >> /etc/sysctl.d/21-solana-validator.conf
echo "net.core.wmem_max = 134217728" >> /etc/sysctl.d/21-solana-validator.conf
echo "# Increase memory mapped files limit" >> /etc/sysctl.d/21-solana-validator.conf
echo "vm.max_map_count = 1000000" >> /etc/sysctl.d/21-solana-validator.conf
echo "# Increase number of allowed open file descriptors" >> /etc/sysctl.d/21-solana-validator.conf
echo "fs.nr_open = 1000000" >> /etc/sysctl.d/21-solana-validator.conf

# Apply the sysctl settings
sysctl -p /etc/sysctl.d/21-solana-validator.conf
