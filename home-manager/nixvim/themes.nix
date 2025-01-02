{ inputs, lib, system, pkgs, ... }:

{
  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
      integrations = {
        cmp = true;
        nvimtree = true;
        treesitter = true;
      };
      transparent_background = true;
    };
  };
}

