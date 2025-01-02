{ specialArgs, inputs, lib, system, pkgs, ... }:

{
  imports = [
    ./lsp.nix
    ./themes.nix
  ];

  extraConfigLuaPre = '''';
  enableMan = true;

  clipboard.providers.xclip.enable = true;

  opts = {
    rnu = true;
    nu = true;
    shiftwidth = 2;
  };

  plugins = {
    lualine.enable = true;
    comment.enable = true;
    dashboard.enable = true;
    godot.enable = true;
    gitsigns.enable = true;
    nvim-tree.enable = true;
    nvim-autopairs.enable = true;
    guess-indent.enable = true;
    web-devicons.enable = true;

    cmp = {
      enable = true;
      autoEnableSources = true;
      autoLoad = true;
    };
    telescope = {
      enable = true;
    };
    treesitter = {
      enable = true;
      settings = {
        auto_install = true;
        highlight.enable = true;
        indent.enable = true;
      };
    };
  };
}
