# My NixOS Flake
## Introduction
This repository contains my NixOS system configuration. I've used NixOS for quite a while now and I've absolutely fell in love with it. NixOS is very complex, and the lack of documentation doesn't help, but its also very fun learning new things!

For now, the system is pretty simple, but it's still a work in progress. A full system is a balance of the window manager, text editor, terminal, application launcher and a whole lot of other utilities, so I'm working on it!

## Programs I use:
### DWM
This was my first ever window manager and right now is my favorite. Since I first switched to GNU/Linux back on 2023, I always wanted to use DWM, but the patching process and the compiling and stuff was kinda hard for me at the time. Afterwards, I used i3, and then Hyprland because ~~wayland is the future of the linux desktop~~ of the pretty animations. But at the back of my mind I always wanted to have a stable, usable (dwm configuration)[https://github.com/zekar47/dwm]. I'm not quite there yet, but I'm trying!

### St
Same thing as DWM, just like to be part of the suckless gang I guess. I didn't really have too many reasons to use ST other than the fact that my previous terminal was kitty, and I honestly didn't like that much the user experience. 

### Dmenu
Wow, you're really seeing a pattern here, right? Dmenu is a bit different, as an application launcher is kinda meh, it does its work. But the cool thing is the amount of extensibility it has. Everything you can think that requires an interactive menu, can be done with this thing. I have a pretty big scripts folde

### Neovim
Yeah, what else could you expect, the editor that everyone (in this space) uses. It has everything you'd ever need.

### Zsh
Is like the perfect combination of usefulness and not being bloated. 

### Pcmanfm
Good file manager.

What? Did you expect for me to use a terminal file manager?
(I'm going to get a lot of angry comments for this) I don't really like terminal file managers lol. I do most of my file managing with `cp` `mv` `ls` `cd` etc... The only reason I'd ever want a file manager is to drag n drop files to other programs and... Idk, maybe nothing else.
> If you know a way to (simulate a) "drag and drop" without a graphical file manager, I'd love to hear that.

## License
This project is licensed under the GNU General Public License v3.0 (GPL-3.0).
