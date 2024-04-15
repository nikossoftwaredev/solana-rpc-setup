#!/bin/bash

# Exit script on any error
set -e

echo "Starting Solana Validator Setup..."

echo "Install Rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"  # Ensure Rust tools are in the PATH

echo "Installing system dependencies..."
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ED444FF07D8D0BF6
sudo apt-get update --fix-missing
sudo apt-get install -y \
    build-essential \
    pkg-config \
    libudev-dev \
    llvm \
    libclang-dev \
    protobuf-compiler

echo "Extracting Solana source archive..."
tar -xzf solana-1.17.31.tar.gz
cd solana-1.17.31

echo "Building and installing Solana..."
./scripts/cargo-install-all.sh .

echo "Adjusting PATH..."
export PATH="$PWD/bin:$PATH"
echo "export PATH=\"$PWD/bin:\$PATH\"" >> ~/.profile

echo "Setup complete! Solana Validator should be operational."


# Initialize Solana installation (if required by the script, check if this step is necessary)
echo "Initializing Solana..."
solana-install init

echo "Setup complete! Solana Validator should be operational."




echo "Step 1: System Tuning..."
./1-system-tuning.sh
echo "System tuning complete."

echo "Step 3: Generating Solana Validator Keys..."
./3-solana-keygen-script.sh
echo "Solana validator keys generation complete."

echo "Step 4: Starting Solana Validator..."
./4-validator.sh
echo "Solana validator startup complete."

echo "Setup complete! Solana Validator should be operational."
