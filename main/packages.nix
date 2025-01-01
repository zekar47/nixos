{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Terminal stuff
    alacritty
    btop
    vim 
    unzip
    wget
    figlet
    p7zip
    git
    stow
    tmux
    killall
    fastfetch
    fzf

    # Internet
    qutebrowser
    firefox-bin
    vesktop
    jellycli
    transmission_4
    qbittorrent-enhanced

    # Games
    lutris
    steam-run
    heroic
    osu-lazer-bin
    tor-browser
    prismlauncher

    # Multimedia
    mpv
    krita

    # Development
    gnumake
    gcc
    cargo
    rustc
    python3

    # Others
    keepassxc
    home-manager
    sxhkd
    font-manager

    # Suckless
    # st
    (st.overrideAttrs (oldAttrs: rec {
      src = /home/zekar/suckless/st;
      buildInputs = oldAttrs.buildInputs or [] ++ [ pkgs.imlib2 pkgs.harfbuzz pkgs.xorg.libXcursor ];
    }))
    # dmenu
    (dmenu.overrideAttrs (oldAttrs: rec {
      src = /home/zekar/suckless/dmenu;
    }))
  ];
}
