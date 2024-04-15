#!/bin/bash

# Set the directory for key storage
key_dir="/solana-keys"

# Create an array of keypair filenames
declare -a keypairs=("validator-keypair.json" "vote-account-keypair.json" "authorized-withdrawer-keypair.json")

# Loop through the keypair list and generate each keypair if it does not already exist
for keypair in "${keypairs[@]}"; do
    keypath="$key_dir/$keypair"
    if [ ! -f "$keypath" ]; then
        echo "Generating $keypair..."
        solana-keygen new -o "$keypath" --no-bip39-passphrase
    else
        echo "$keypair already exists. Skipping..."
    fi
done

echo "Keypair generation complete."
