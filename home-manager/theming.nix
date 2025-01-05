{ pkgs, inputs, ...}:
{
  gtk = {
    enable = true;
    cursorTheme = {
      name = "graphite-cursors";
      size = 24;
    };
  };
}
