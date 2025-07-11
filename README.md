# Installation

- When installing do not use sudo to run `installation.sh`
- Before running the last command in the file `installation.sh`, you have got to run `nix-prefetch-git https://github.com/tmux-plugins/tpm.git` and add the rev and sha256 from the output of the given command to the `home.nix` file

# Terminal

- For the windows terminal configuration, only the following keys should be transfered:
- - profiles
- - schemes
- - themes

# Tmux

- Do not forget to run `prefix + I` to install all plugins and themes
