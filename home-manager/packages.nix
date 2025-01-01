{ config, pkgs, inputs, ... }:

let
  neovimconfig = import ./nixvim;
  nvim = inputs.nixvim.legacyPackages.x86_64-linux.makeNixvimWithModule {
  inherit pkgs;
  module = neovimconfig;
  };
in
{
  home.packages = with pkgs; [
    # Terminal utilities
    nvim
    figlet

    # Internet
    qutebrowser
    vesktop
    jellycli
    # transmission_4
    # qbittorrent-enhanced
    # tor-browser

    # Games
    lutris
    steam-run
    # heroic
    # osu-lazer-bin
    # prismlauncher

    # Multimedia
    # krita

    # Development
    cargo

    # Others
    keepassxc
    font-manager
  ];
}
