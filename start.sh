# Reload systemd to recognize new service
echo "Reloading systemd..."
sudo systemctl daemon-reload

# Enable Solana Validator service to start at boot
echo "Enabling Solana Validator service..."
sudo systemctl enable solana-validator.service

# Start the service
echo "Starting Solana Validator service..."
sudo systemctl start solana-validator.service
