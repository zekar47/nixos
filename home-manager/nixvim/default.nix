{ inputs, lib, system, pkgs, ... }:
{
  colorschemes.oxocarbon.enable = true;


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
    lsp = {
      enable = true;
      servers = {
        bashls.enable = true;
        clangd.enable = true;
        cssls.enable = true;
        # gdscript.enable = true;
        html.enable = true;
        java_language_server.enable = true;
        jsonls.enable = true;
        lua_ls.enable = true;
        markdown_oxide.enable = true;
        nixd.enable = true;
        pyright.enable = true;
        rust_analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };
      };
    };
  };
}
