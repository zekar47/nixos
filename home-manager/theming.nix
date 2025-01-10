{ pkgs, inputs, ...}:
{
  imports = [
    #./colors.nix
  ];
  gtk = {
    enable = true;
    cursorTheme = {
      name = "catppuccin-cursors";
      package = pkgs.catppuccin-cursors;
      size = 24;
    };
    theme = {
      name = "catppuccin-gtk";
      package = pkgs.catppuccin-gtk;
    };
  };
}
