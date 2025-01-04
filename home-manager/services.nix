{ specialArgs, config, pkgs, inputs, ... }:
{
  imports = [
    ./programs/sxhkd.nix
  ];
  services = {
  };
}
