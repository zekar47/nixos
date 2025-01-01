{ inputs, lib, system, pkgs, ... }:

{
  imports = [
    ./zsh/zsh.nix
    ./fastfetch/fastfetch.nix

  ];
  programs = {
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

    git = {
      enable = true;
      userName = "zekar47";
      userEmail = "";
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
