{ specialArgs, config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./programs.nix
    ./packages.nix
    ./files/files.nix
    ./services.nix
    ./theming.nix
    ./xdg.nix
  ];

  home = {
    username = "zekar";
    homeDirectory = "/home/zekar";
    stateVersion = "23.11";
    sessionVariables = {};
  };
}
