{ pkgs, inputs, ...}:
{
  imports = [
    #./colors.nix
  ];
  gtk = {
    enable = true;
    cursorTheme = {
      name = "catppuccin-cursors-mocha";
      package = pkgs.catppuccin-cursors;
      size = 24;
    };
    theme = {
      name = "Catppuccin-Mocha-Compact-Red-Dark";
    };
  };
  qt = {
    enable = true;
    platformTheme = "qtct";
    style = {
      package = pkgs.catppuccin-qt5ct;
      name = "catppuccin-mocha-red";
    };
  };
}
