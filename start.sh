# Clearing previous logs
sudo journalctl --vacuum-time=1s

# Reload systemd to recognize new service
echo "Reloading systemd..."
sudo systemctl daemon-reload
sudo systemctl disable solana-validator.service
sudo systemctl stop solana-validator.service

# Enable Solana Validator service to start at boot
echo "Enabling Solana Validator service..."
sudo systemctl enable solana-validator.service

# Start the service
echo "Starting Solana Validator with the following limits:"
sudo systemctl start solana-validator.service

sudo journalctl -u solana-validator.service -f

