{ config, pkgs, ... }:
{
  services = {
    spice-vdagentd.enable = true;
    tailscale.enable = true;
    openssh.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    udev.extraRules = ''
        ACTION=="add", KERNEL=="sd*", SUBSYSTEM=="block", RUN+="/bin/sh /home/zekar/scripts/automount.sh"
    '';
    #  ACTION=="add", SUBSYSTEM=="power_supply", ENV{POWER_SUPPLY_NAME}=="AC", RUN+="/usr/bin/env pkill -RTMIN+3 dwmblocks"

    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
	#        options = "caps:swapescape";
      };
      displayManager.startx.enable = true;
      windowManager = {
        dwm = {
          enable = true;
          package = pkgs.dwm.overrideAttrs (oldAttrs: {
            src = /home/zekar/suckless/dwm;
            buildInputs = oldAttrs.buildInputs or [] ++ [ pkgs.imlib2 pkgs.xorg.libXrender pkgs.xorg.libXext pkgs.pango ];
          });
        };
      };
    };
  };
}
