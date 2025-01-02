{ specialArgs, config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    inputs.nix-colors.homeManagerModules.default
    ./colorScheme.nix
    ./programs.nix
    ./packages.nix
  ];

  home = {
    username = "zekar";
    homeDirectory = "/home/zekar";
    stateVersion = "23.11";
    file = {};
    sessionVariables = {};
  };
}
