{ specialArgs, config, pkgs, inputs, system, ... }:

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
    nvim
    figlet

    # Internet
    qutebrowser
    floorp
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
    steam-run
    # heroic # For some reason it fails to build, I'll check it out later.
    osu-lazer-bin
    prismlauncher

    # Multimedia
    krita
    nsxiv
    musescore
    zathura

    # Development
    cargo

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
  ];
}
