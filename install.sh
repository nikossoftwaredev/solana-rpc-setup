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
echo 'export PATH="$PATH:/root/.local/share/solana/install/releases/stable-d0ed878d573c7f5391cd2cba20465407f63f11a8/solana-release/bin"' >> ~/.bashrc

source ~/.bashrc



# Create systemd service file for Solana Validator
echo "Creating Solana Validator service file..."
cat <<EOF | sudo tee /etc/systemd/system/solana-validator.service > /dev/null
[Unit]
Description=Solana Validator Service
After=network.target

[Service]
Environment="PATH=/root/.local/share/solana/install/releases/stable-d0ed878d573c7f5391cd2cba20465407f63f11a8/solana-release/bin:$PATH"
Environment=SOLANA_METRICS_CONFIG=host=https://metrics.solana.com:8086,db=testnet,u=scratch_writer,p=topsecret 
StandardOutput=journal
StandardError=inherit
ExecStart=/root/solana-rpc-setup/validator.sh
User=root
Restart=always
LimitNOFILE=1000000

[Install]
WantedBy=multi-user.target
EOF

echo "Setup complete! Solana Validator should be operational."
