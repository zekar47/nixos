{ config, lib, pkgs, ...}:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
	type = "kitty-direct";
	source = "./logo.png";
	width = 30;
      };
      display = {
	separator = " -> ";
      };
      modules = [
	{
	  type = "custom";
	  format = "\u001b[31m・・・Z・E・K・A・R・・・";
	  keyColor = "red";
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
