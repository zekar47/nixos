{ inputs, lib, system, pkgs, ... }:

# Anything that can't be declared here, will be declared on ./packages.nix
{
  imports = [
    ./zsh/zsh.nix
    ./fastfetch/fastfetch.nix
  ];

  programs = {
    btop = {
      enable = true;
      settings = {
        vim_keys = true;
        rounded_corners = true;
      };
    };
    cava = {
      enable = true;
      settings = {
        general.framerate = 240;
        color.foreground = "red";
        smoothing.noise_reduction = 20;
      };
    };

    eza = {
      enable = true;
      enableZshIntegration = true;
      icons = "always";
      extraOptions = [
        "-hAl"
        "--color=always"
        "--group-directories-first"
        "--hyperlink"
      ];
    };

    firefox = {
      enable = true;
      package = pkgs.firefox-bin;
    };

    fzf.enable = true;

    git = {
      enable = true;
      userName = "zekar47";
      userEmail = "";
    };

    mpv = {
      enable = true;
    };

    tmux = {
      enable = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    home-manager.enable = true;
  };
}
