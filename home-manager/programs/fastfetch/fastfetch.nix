{ specialArgs, config, lib, pkgs, ...}:

let
  img = if (specialArgs.hostName == "lap") then "/home/zekar/nixos/home-manager/fastfetch/blue.png" else "/home/zekar/nixos/home-manager/fastfetch/red.png";
  col = if (specialArgs.hostName == "lap") then "cyan" else "red";
in
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
	# type = "sixel";
	type = "auto";
	# source = img;
	width = 30;
      };
      display = {
	separator = " - ";
      };
      modules = [
	{
	  type = "custom";
	  format = "・・・Z・E・K・A・R・・・";
	  outputColor = col;
	}
	"break"
	{
	  type = "os";
	  keyColor = col;
	}
	{
	  type = "packages";
	  keyColor = col;
	}
	"break"
	{
	  type = "cpu";
	  keyColor = col;
	}
	{
	  type = "gpu";
	  keyColor = col;
	}
	{
	  type = "memory";
	  keyColor = col;
	}
	"break"
	"break"
	"colors"
      ];
    };
  };
}
