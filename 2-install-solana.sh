

#!/bin/bash

# Path to install Solana
INSTALL_PATH="$HOME/.local/share/solana/install/active_release/bin"

# Download and install Solana
echo "Downloading and installing Solana..."
sh -c "$(curl -sSfL https://release.solana.com/stable/install)"
# Update .profile to include Solana's path (check if already present to avoid duplicates)
if ! grep -q "export PATH=\"$INSTALL_PATH:\$PATH\"" ~/.profile; then
    echo "export PATH=\"$INSTALL_PATH:\$PATH\"" >> ~/.profile
    echo "PATH updated in .profile. Please restart your terminal or source ~/.profile"
else
    echo "PATH already updated in .profile."
fi

# Source the profile to update the PATH in the current session
export PATH="$INSTALL_PATH:$PATH"
echo "PATH updated for the current session."

# Solana installation complete message
echo "Solana installation complete."
