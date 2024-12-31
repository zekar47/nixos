{ inputs, lib, system, pkgs, ... }
{
  enable = true;
  defaultEditor = true;

  colorschemes.catppuccin.enable = true;

  plugins = {
    lualine.enable = true;
  };
}
