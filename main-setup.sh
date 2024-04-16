#!/bin/bash

# Exit script on any error
set -e

echo "Starting Solana Validator Setup..."

# Check if the solana user exists
if ! id -u solana &>/dev/null; then
    echo "Creating Solana user..."
    sudo useradd -m -s /bin/bash solana
    sudo usermod -aG sudo solana
else
    echo "Solana user already exists."
fi


echo "Installing Solana..."
sh -c "$(curl -sSfL https://release.solana.com/stable/install)"

# Now, immediately export and use the new PATH
echo 'export PATH="$PATH:solana/.local/share/solana/install/active_release/bin"' >> ~/.bashrc
source ~/.bashrc


echo "Step 1: System Tuning..."
./1-system-tuning.sh
echo "System tuning complete."

echo "Step 2: Starting Rpc..."
./2-start-rpc.sh

echo "Setup complete! Solana Validator should be operational."
