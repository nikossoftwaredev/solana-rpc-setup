#!/bin/bash

# Create systemd service file for Solana Validator
echo "Creating Solana Validator service file..."
cat <<EOF | sudo tee /etc/systemd/system/solana-validator.service > /dev/null
[Unit]
Description=Solana Validator Service
After=network.target

[Service]
ExecStart=/home/solana/solana-rpc-setup/validator.sh
User=solana
Restart=always
LimitNOFILE=1000000
MemoryLimit=2.5G

[Install]
WantedBy=multi-user.target
EOF



