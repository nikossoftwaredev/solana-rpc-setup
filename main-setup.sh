#!/bin/bash

# Exit script on any error
set -e
set -o errexit
set -o nounset
set -o pipefail

echo "Starting Solana Validator Setup..."

echo "Installing Solana..."
sh -c "$(curl -sSfL https://release.solana.com/stable/install)"

# Now, immediately export and use the new PATH
echo 'export PATH="$PATH:nikossoftwaredev/.local/share/solana/install/active_release/bin"' >> ~/.bashrc
source ~/.bashrc


echo "Step 1: System Tuning..."
./1-system-tuning.sh
echo "System tuning complete."

echo "Step 2: Starting Rpc..."
./2-start-rpc.sh

echo "Setup complete! Solana Validator should be operational."
