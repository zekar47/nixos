{ inputs, lib, system, pkgs, ... }:

{
  services.sxhkd = {
    enable = true;
    keybindings = {
      # Launching stuff
      "super + return" = "st";
      "super + d" = "dmenu_run -c -g 2 -l 30";
      "super + w" = "floorp";
      "super + p" = "cd ~/Pictures/Wallpapers && nsxiv -t -g$(~/nixos/scripts/calcCenterGeo.sh 1000 1300) *";
      "super + n" = "st newsboat";
      "super + x" = "~/Undertale/Undertale/run.sh";

      # Running scripts
      "super + shift + s" = "scrot --select -f -l width=3 - | xclip -selection clipboard -target image/png";
      "Print" = "scrot - | xclip -selection clipboard -target image/png";

      # THINGS THAT EVERY AUDIO SERVICE SHOULD HAVE BY DEFAULT BUT FOR SOME REASON THEY DON'T HAVE IT.
      "XF86AudioRaiseVolume" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
      "XF86AudioLowerVolume" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
      "XF86AudioMute"        = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
    };
  };
}

/* I'll put my dwm keybindings here too so I make sure don't overlap and stuff okay? byeee.
Mod + j: Go down the stack.
Mod + k: Go up the stack.
Mod + Shift + j: Move down the stack.
Mod + Shift + k: Move up the stack.
Mod + i: Increase master.
Mod + u: Decrease master.
Mod + h: Change window size left.
Mod + l: Change window size right.
Mod + m: Set master.
Mod + q: Kill active window.
Mod + v: Toggle floating mode.
Mod + f: Toggle fullscreen.
Mod + F5: xrdb reset.
Mod + Shift + e: kill dwm.
  */
