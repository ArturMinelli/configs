{ config, pkgs, ... }: 

{
  home.username = "artur";
  home.homeDirectory = "/home/artur";
  home.stateVersion = "24.05";

  home.packages = [
    pkgs.zoxide
    pkgs.oh-my-posh
    pkgs.neovim
    pkgs.bat
    pkgs.tmux
    pkgs.eza
  ];

  home.file = {
    ".tmux.conf".source = ~/configs/tmux.conf;
    ".bashrc".source = ~/configs/bashrc.sh;
    ".tmux/plugins/tpm" = {
      source = pkgs.fetchgit {
        url = "https://github.com/tmux-plugins/tpm";
        # Replace the following with the latest commit hash from the main branch:
        rev = "nix-prefetch-git https://github.com/tmux-plugins/tpm.git";
        # Replace the following with the sha256 from nix-prefetch-git:
        sha256 = "01ribl326n6n0qcq68a8pllbrz6mgw55kxhf9mjdc5vw01zjcvw5";
      };
    };
  };

  programs.home-manager.enable = true;
}
