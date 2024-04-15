#!/bin/bash

# Exit script on any error
set -e

echo "Starting Solana Validator Setup..."

# Install Rust
echo "Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Ensure the Rust tools are in the PATH
source $HOME/.cargo/env

# Install required packages
echo "Installing system dependencies..."
sudo apt-get update
sudo apt-get install -y \
    build-essential \
    pkg-config \
    libudev-dev \
    llvm \
    libclang-dev \
    protobuf-compiler

# Extract the solana source archive
echo "Extracting Solana source archive..."
tar -xzf solana-1.17.31.tar.gz

# Navigate to the extracted directory
cd solana-1.17.31

# Run the included script to build and install Solana
echo "Building and installing Solana..."
./scripts/cargo-install-all.sh .

# Assuming that the install script places binaries in the 'bin' directory relative to the current directory,
# Add the bin directory to the PATH
export PATH="$PWD/bin:$PATH"
echo "export PATH=\"$PWD/bin:\$PATH\"" >> ~/.profile

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
