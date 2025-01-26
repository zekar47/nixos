{ inputs, lib, system, pkgs, ... }:

{
  plugins.lsp = {
    enable = true;
    servers = {
      bashls.enable = true;
      clangd.enable = true;
      cssls.enable = true;
      gdscript = {
        enable = true;
        package = null;
      };
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
}
