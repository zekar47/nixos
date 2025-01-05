{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # Terminal stuff
    unzip
    wget
    p7zip
    stow
    tmux
    killall
    file
    fzf

    # Internet
    firefox-bin

    # Development
    gnumake
    gcc
    rustc
    python3

    # Others
    pavucontrol
    nix-ld
    
    # X11
    xorg.libXxf86vm
    sxhkd
    xclip

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
