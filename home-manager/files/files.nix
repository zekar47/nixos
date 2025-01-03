{ specialArgs, config, pkgs, inputs, ... }:

let
  xinitpath = if (specialArgs.hostName == "lap") then "/home/zekar/nixos/home-manager/files/lap/.xinitrc" else "/home/zekar/nixos/home-manager/files/pc/.xinitrc";
in
{
  home.file.".xinitrc" = {
    enable = true;
    source = xinitpath;
    target = ".xinitrc";
  };
}
