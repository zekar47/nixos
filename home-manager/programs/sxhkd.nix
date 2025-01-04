{ inputs, lib, system, pkgs, ... }:

{
  services.sxhkd = {
    enable = true;
    keybindings = {
      # Launching stuff
      "super + return" = "st";
      "super + d" = "dmenu_run";
      "super + w" = "floorp";
      "super + p" = "cd /home/zekar/Pictures/Wallpapers && nsxiv -t *";
      "super + n" = "st newsboat";

      # Running scripts
      "super + shift + s" = "scrot --select -f -l width=3 - | xclip -selection clipboard -target image/png";
      "Print" = "scrot - | xclip -selection clipboard -target image/png";
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
