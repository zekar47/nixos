# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Monterrey";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure xserver
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
    displayManager.startx.enable = true;
    windowManager = {
      dwm = {
        enable = true;
        package = pkgs.dwm.overrideAttrs {
          src = /home/zekar/suckless/dwm;
        };
      };
    };
  };
  
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


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zekar = {
    isNormalUser = true;
    description = "zekar";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
  users.defaultUserShell = pkgs.zsh;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget

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

    # Games
    lutris
    steam-run

    # Multimedia
    mpv

    # Development
    gnumake
    gcc
    cargo
    rustc
    python3

    # Others
    keepassxc
    home-manager
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

  # Some programs need SUID wrappers, can be configured further or are

  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  programs.zsh.enable = true;
  programs.nix-ld = {
    enable = true;
    # libraries = [
    #   pkgs.steam-run.fhsenv.args.multiPkgs
    #   pkgs
    # ];
  };
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };
  
  # security.rtkit.enable = true;
  # List services that you want to enable:
  services.spice-vdagentd.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
