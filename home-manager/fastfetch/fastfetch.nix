{ config, lib, pkgs, ...}:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
	type = "kitty-direct";
	source = "/home/zekar/nixos/home-manager/fastfetch/logo.png";
	width = 30;
      };
      display = {
	separator = " - ";
      };
      modules = [
	{
	  type = "custom";
	  format = "・・・Z・E・K・A・R・・・";
	  outputColor = "red";
	}
	"break"
	{
	  type = "os";
	  keyColor = "red";
	}
	{
	  type = "packages";
	  keyColor = "red";
	}
	"break"
	{
	  type = "cpu";
	  keyColor = "red";
	}
	{
	  type = "gpu";
	  keyColor = "red";
	}
	{
	  type = "memory";
	  keyColor = "red";
	}
	"break"
	"break"
	"colors"
      ];
    };
  };
}
