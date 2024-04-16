#!/bin/bash

# Exit script on any error
set -e

echo "Starting Solana Validator Setup..."

echo "Installing Solana..."
sh -c "$(curl -sSfL https://release.solana.com/stable/install)"

# Now, immediately export and use the new PATH
export PATH="/root/.local/share/solana/install/active_release/bin:$PATH"
echo "export PATH=\"/root/.local/share/solana/install/active_release/bin:\$PATH\"" >> ~/.profile

echo "Step 1: System Tuning..."
./1-system-tuning.sh
echo "System tuning complete."

echo "Step 2: Starting Rpc..."
./2-start-rpc.sh

echo "Setup complete! Solana Validator should be operational."
