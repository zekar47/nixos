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
    btop
    nvim
    figlet
    fastfetch
    fzf
    tmux
    git

    # Internet
    qutebrowser
    firefox-bin
    vesktop
    jellycli
    transmission_4
    qbittorrent-enhanced
    tor-browser

    # Games
    lutris
    steam-run
    heroic
    osu-lazer-bin
    prismlauncher

    # Multimedia
    mpv
    krita

    # Development
    cargo

    # Others
    keepassxc
    font-manager
  ];
}
