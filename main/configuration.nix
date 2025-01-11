# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ 
      ./packages.nix
      ./services.nix
      ./virtualisation.nix
    ];

  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Monterrey";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.zsh;
    users.zekar = {
      isNormalUser = true;
      description = "zekar";
      extraGroups = [ "networkmanager" "wheel" "podman" ];
    };
  };


  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs = {
    zsh.enable = true;
    steam.enable = true;
    dconf.enable = true;
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        stdenv.cc.cc
        zlib
        fuse3
        icu
        nss
        openssl
        curl
        expat
        xorg.libXxf86vm
      ];
    };
  };

  nixpkgs.overlays = [
    (final: prev: {
      dwmblocks = prev.dwmblocks.override (old: {
        src = /home/zekar/suckless/dwmblocks;
      });
    })
  ];

  fonts.packages = with pkgs ; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    # (nerdfonts.override { fonts = [ "FiraCode" 	"DroidSansMono" "JetBrainsMono" "Monofur" "Mononoki" "Iosevka" ]; })
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.monofur
    nerd-fonts.mononoki
    nerd-fonts.iosevka
  ];

  home-manager.backupFileExtension = "backup";
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
