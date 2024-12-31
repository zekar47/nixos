{ inputs, config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraConfig = ''
      set rnu
      set nu
    '';
    extraPackages = with pkgs; [
      lua-language-server
      pyright
      superhtml
      libclang
      clang-tools
      jdt-language-server
      xclip
      nil
      luajitPackages.lua-lsp
      rust-analyzer
    ];
    plugins = with pkgs.vimPlugins; [
      base46
      nvchad-ui
      nvim-tree-lua
      nvim-web-devicons
      gitsigns-nvim
      nvim-lspconfig
      nvim-cmp
      telescope-nvim
      nvim-treesitter.withAllGrammars
      nvim-autopairs
    ];
  };
}
