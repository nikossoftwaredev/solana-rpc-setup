#!/bin/bash

sh -c "$(curl -sSfL https://release.solana.com/stable/install)"

# Assuming installation command here (ensure it's correct and complete)
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
