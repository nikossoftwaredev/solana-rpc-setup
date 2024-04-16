#!/bin/bash

# Create systemd service file for Solana Validator
echo "Creating Solana Validator service file..."
cat <<EOF | sudo tee /etc/systemd/system/solana-validator.service > /dev/null
[Unit]
Description=Solana Validator
After=network.target

[Service]
User=root
ExecStart=/home/nikossoftwaredev/solana-rpc-setup/validator.sh
Restart=on-failure
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

# Display the status
echo "Displaying Solana Validator service status..."
sudo systemctl status solana-validator.service
