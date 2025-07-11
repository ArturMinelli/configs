#!/bin/bash

# Install Nix if not already installed
if ! command -v nix &> /dev/null; then
  sh <(curl -L https://nixos.org/nix/install) --daemon
  source ~/.bashrc
fi

# Add or update nixpkgs channel
nix-channel --add https://nixos.org/channels/nixpkgs-24.05-darwin nixpkgs 2>/dev/null || nix-channel --update nixpkgs
source ~/.bashrc

# Add or update Home Manager channel (latest stable)
nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz home-manager 2>/dev/null || nix-channel --update home-manager
source ~/.bashrc

# Update all channels
nix-channel --update
source ~/.bashrc

# Install Home Manager if not already installed
if ! command -v home-manager &> /dev/null; then
  nix-shell '<home-manager>' -A install
  source ~/.bashrc
fi

# Install nix-prefetch-git if not already installed
if ! nix-env -q nix-prefetch-git &> /dev/null; then
  nix-env -iA nixpkgs.nix-prefetch-git
  source ~/.bashrc
fi

nix-prefetch-git https://github.com/tmux-plugins/tpm.git

# Switch Home Manager configuration if file exists
HM_CONFIG="/home/artur/configs/home.nix"
if [ -f "$HM_CONFIG" ]; then
  home-manager switch -f "$HM_CONFIG"
  source ~/.bashrc
else
  echo "Home Manager config not found at $HM_CONFIG. Skipping switch."
fi
