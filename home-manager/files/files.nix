{ specialArgs, config, pkgs, inputs, ... }:

let
  xinitpath = if (specialArgs.hostName == "lap") then "/home/zekar/nixos/home-manager/files/lap/.xinitrc" else "/home/zekar/nixos/home-manager/files/pc/.xinitrc";
in
{
  home.file.".xinitrc" = {
    source = xinitpath;
    target = ".xinitrc";
  };
  home.file.picom_config = {
    source = ./picom.conf;
    target = ".config/picom/picom.conf";
  };
}
