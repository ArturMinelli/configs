#!/bin/bash

sh <(curl -L https://nixos.org/nix/install) --daemon

nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install

nix-env -iA nixpkgs.nix-prefetch-git

home-manager switch -f /home/artur/.config/nix/home-manager/home.nix
