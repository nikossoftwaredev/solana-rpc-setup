#!/bin/bash

# Define the installation path for Solana tools
solana_path="/root/.local/share/solana/install/active_release/bin"

# Step 1: Update PATH in current session and permanently
export PATH="$solana_path:$PATH"
echo "export PATH=\"$solana_path:\$PATH\"" >> ~/.profile

# Verify Solana installation and version
if ! command -v solana-keygen &>/dev/null; then
    echo "Solana tools are not installed or not found in PATH. Attempting to install Solana..."
    # Assume this is the command to install Solana
    sh -c "$(curl -sSfL https://release.solana.com/stable/install)"
else
    echo "Solana installation verified. Proceeding with key generation..."
fi
