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

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd to recognize new service
echo "Reloading systemd..."
sudo systemctl daemon-reload

# Enable Solana Validator service to start at boot
echo "Enabling Solana Validator service..."
sudo systemctl enable solana-validator.service

# Start the service
echo "Starting Solana Validator service..."
sudo systemctl start solana-validator.service


