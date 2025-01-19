{ specialArgs, config, pkgs, inputs, system, game-rs, ... }:

let
  neovimconfig = import ./nixvim;
  nvim = inputs.nixvim.legacyPackages.x86_64-linux.makeNixvimWithModule {
    inherit pkgs;
    # inherit specialArgs;
    module = neovimconfig;
  };
in
{
  home.packages = with pkgs; [
    # Terminal utilities
    alacritty
    nvim
    figlet
    groff
    imagemagick
    ghostscript

    # Internet
    qutebrowser
    brave
    vesktop
    jellycli
    transmission_4
    qbittorrent-enhanced
    youtube-tui
    yt-dlp
    tor-browser
    newsboat

    # Games
    lutris
    # heroic # For some reason it fails to build, I'll check it out later.
    osu-lazer-bin
    prismlauncher
    godot_4
    lunar-client

    # Multimedia
    obs-studio
    krita
    nsxiv
    musescore
    zathura
    catppuccinifier-cli

    # Development
    cargo
    libqalculate

    # X11
    sxhkd
    maim
    slop
    xdotool
    picom
    scrot

    # Others
    keepassxc
    pcmanfm
    font-manager
    via
  ];
}
