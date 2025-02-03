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
    lxappearance
    # Terminal utilities
    alacritty
    nvim
    figlet
    groff
    imagemagick
    ghostscript
    qrrs

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

    # DAW
    ardour
    distrho-ports
    vital

    # Multimedia
    audacity
    ffmpeg
    obs-studio
    krita
    nsxiv
    musescore
    zathura
    catppuccinifier-cli
    inkscape

    # Development
    cargo
    libqalculate
    jdk

    # X11
    sxhkd
    weston
    waydroid
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
    super-productivity
  ];
}
