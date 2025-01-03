{ specialArgs, config, lib, pkgs, ...}:

{
  services.picom = {
    enable = true;
    shadow = true;
  };
}
