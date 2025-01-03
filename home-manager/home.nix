{ specialArgs, config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    inputs.nix-colors.homeManagerModules.default
    ./colorScheme.nix
    ./programs.nix
    ./packages.nix
    ./files/files.nix
    ./services.nix
  ];

  home = {
    username = "zekar";
    homeDirectory = "/home/zekar";
    stateVersion = "23.11";
    sessionVariables = {};
  };
}
