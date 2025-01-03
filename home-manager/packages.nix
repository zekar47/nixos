{ specialArgs, config, pkgs, inputs, ... }:

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
    tor-browser

    # Games
    lutris
    steam-run
    # heroic # For some reason it fails to build, I'll check it out later.
    osu-lazer-bin
    prismlauncher

    # Multimedia
    krita
    feh
    nsxiv

    # Development
    cargo

    # X11
    sxhkd
    maim
    slop

    # Others
    keepassxc
    pcmanfm
    font-manager
  ];
}
