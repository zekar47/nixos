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
    floorp
    wirelesstools

    # Development
    gnumake
    gcc
    rustc
    python3

    # Others
    pavucontrol
    distrobox
    nix-ld
    qemu
    
    # X11
    cage
    xorg.libXxf86vm
    sxhkd
    xclip
    polkit
    polkit_gnome
    
    # Suckless
    # st
    (st.overrideAttrs (oldAttrs: rec {
      src = /home/zekar/suckless/st;
      buildInputs = oldAttrs.buildInputs or [] ++ [ pkgs.imlib2 pkgs.harfbuzz pkgs.xorg.libXcursor xorg.libXft ];
    }))
    # dmenu
    (dmenu.overrideAttrs (oldAttrs: rec {
      src = /home/zekar/suckless/dmenu;
      buildInputs = oldAttrs.buildInputs or [] ++ [ pkgs.xorg.libXrender xorg.libXft ];
    }))
    (dwmblocks.overrideAttrs (oldAttrs: rec {
      src = /home/zekar/suckless/dwmblocks;
    }))
  ];
}
