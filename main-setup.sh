#!/bin/bash

# Exit script on any error
set -e

echo "Starting Solana Validator Setup..."

echo "Installing Solana..."
sh -c "$(curl -sSfL https://release.solana.com/stable/install)"

# Now, immediately export and use the new PATH
export PATH="/root/.local/share/solana/install/active_release/bin:$PATH"
echo "export PATH=\"/root/.local/share/solana/install/active_release/bin:\$PATH\"" >> ~/.profile

# Verify installation and proceed
if command -v solana-keygen >/dev/null 2>&1; then
    echo "Solana installation verified. Proceeding with key generation..."
else
    echo "Solana installation failed or solana-keygen not found in PATH."
    exit 1
fi

echo "Step 1: System Tuning..."
./1-system-tuning.sh
echo "System tuning complete."

echo "Step 4: Starting Solana Validator..."
./2-validator.sh
echo "Solana validator startup complete."

echo "Setup complete! Solana Validator should be operational."
