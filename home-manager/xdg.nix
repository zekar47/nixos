{ specialArgs, config, pkgs, inputs, ... }:

{
  xdg = {
    mimeApps = {
      enable = true;
      defaultApplications = {
	"image/png" = [ "nsxiv.desktop" ];
	"image/jpeg" = [ "nsxiv.desktop" ];
	"image/gif" = [ "nsxiv.desktop" ];
	"image/bmp" = [ "nsxiv.desktop" ];
	"image/webp" = [ "nsxiv.desktop" ];

	"inode/directory" = [ "pcmanfm.desktop" ];

	"x-scheme-handler/http" = [ "floorp.desktop" ];
	"x-scheme-handler/https" = [ "floorp.desktop" ];
	"x-scheme-handler/chrome" = [ "floorp.desktop" ];
	"text/html" = [ "floorp.desktop" ];
	"application/x-extension-htm" = [ "floorp.desktop"];
	"application/x-extension-html" = [ "floorp.desktop"];
	"application/x-extension-shtml" = [ "floorp.desktop"];
	"application/xhtml+xml" = [ "floorp.desktop"];
	"application/x-extension-xhtml" = [ "floorp.desktop"];
	"application/x-extension-xht" = [ "floorp.desktop"];
      };
    };
    desktopEntries = {
      "nsxiv" = {
	name = "nsxiv";
	exec = "nsxiv";
      };
      "st" = {
	name = "st";
	exec = "st";
      };
    };
  };
}
