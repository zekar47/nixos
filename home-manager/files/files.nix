{ specialArgs, config, pkgs, inputs, ... }:

let
  xinitpath = if (specialArgs.hostName == "lap") then "/home/zekar/nixos/home-manager/files/lap/.xinitrc" else "/home/zekar/nixos/home-manager/files/pc/.xinitrc";
in
{
  home.file = {
    ".xinitrc" = {
      source = xinitpath;
      target = ".xinitrc";
    };
    picomConfig = {
        source = ./picom.conf;
        target = ".config/picom/picom.conf";
    };
  };

  xdg.configFile = {
    nsxivKeys = {
      source = ./nsxiv;
      target = "./nsxiv/exec/key-handler";
      executable = true;
    };
  };
}
