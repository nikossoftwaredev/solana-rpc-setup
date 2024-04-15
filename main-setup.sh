#!/bin/bash

# Exit script on any error
set -e

echo "Starting Solana Validator Setup..."

echo "Step 1: System Tuning..."
./1-system-tuning.sh
echo "System tuning complete."

echo "Step 2: Installing Solana..."
./2-install-solana.sh
echo "Solana installation complete."

echo "Step 3: Generating Solana Validator Keys..."
./3-solana-keygen-script.sh
echo "Solana validator keys generation complete."

echo "Step 4: Starting Solana Validator..."
./4-validator.sh
echo "Solana validator startup complete."

echo "Setup complete! Solana Validator should be operational."
