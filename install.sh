#!/bin/bash

# Exit script on any error
set -e
set -o errexit
set -o pipefail

echo "Starting Solana Validator Setup..."


echo "Installing Solana..."
sh -c "$(curl -sSfL https://release.solana.com/stable/install)"

# Now, immediately export and use the new PATH
echo 'export PATH="$PATH:root/.local/share/solana/install/active_release/bin"' >> ~/.bashrc

source ~/.bashrc



# Create systemd service file for Solana Validator
echo "Creating Solana Validator service file..."
cat <<EOF | sudo tee /etc/systemd/system/solana-validator.service > /dev/null
[Unit]
Description=Solana Validator Service
After=network.target

[Service]
Environment="PATH=/root/.local/share/solana/install/active_release/bin:$PATH"
StandardOutput=journal
StandardError=inherit
ExecStart=/root/solana-rpc-setup/validator.sh
User=root
Restart=always
LimitNOFILE=1000000

[Install]
WantedBy=multi-user.target
EOF

# validator.service file
echo "Creating Systuner service file..."
cat <<EOF | sudo tee /etc/systemd/system/systuner.service > /dev/null
[Unit]
Description=Solana System Tuner 
After=network.target 
[Service]
Type=simple 
Restart=on-failure 
RestartSec=1 
LogRateLimitIntervalSec=0 
ExecStart=/home/root/.local/share/solana/install/active_release/bin/solana-sys-tuner --user root
[Install]
WantedBy=multi-user.target
EOF

echo "Setup complete! Solana Validator should be operational."
