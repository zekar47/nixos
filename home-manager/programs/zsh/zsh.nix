{ config, lib, pkgs, ...}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
    autosuggestion = {
      enable = true;
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "alias-finder"
        "sudo"
        "tailscale"
        "vi-mode"
        "zoxide"
      ];
    };
    shellAliases = {
      # Shorter names
      v = "nvim";
      sv = "sudo nvim";
      ff = "fastfetch";
      x = "startx";

      # Changing default programs
      ls = "eza";
      cd = "z";
      sxiv = "nsxiv";
      mupdf = "zathura";
      pdf = "zathura"; # I love zathura, but it has such an uncomfortable name to type (I hate the "za")

      # Adding flags by default
      grep = "grep --color=auto";
      egrep = "egrep --color=auto";
      fgrep = "fgrep --color=auto";
      cp = "cp -i";
      df = "df -h";
      mkdir = "mkdir -pv";
      ping = "ping -c 5";

      # Development
      venv = "source venv/bin/activate";
      cvenv = "python3 -m venv venv"; # As in "Create venv"

      # Git
      clon = "git clone";
      gadd = "git add .";
      gcom = "git commit -m";
      push = "git push origin";
      pull = "git pull origin";

      # yt-dlp
      yt-dlp-pl = "yt-dlp -i --extract-audio --audio-format flac --output \"%(playlist_title)s/%(playlist_index)03d. %(title)s.%(ext)s)\"";

      # Scripts
      extract = "~/nixos/scripts/extract.sh";

      # NixOS
      rb = "sudo nixos-rebuild switch --flake /home/zekar/nixos --impure";
      nc = "nvim /home/zekar/nixos/main/configuration.nix"; # As in "Nix Config"
    };
    initExtra = ''
      export PATH="$HOME/nixos/scripts:$PATH"
      fastfetch

      # Unset the NEWLINE variable initially
      unset NEWLINE

      # Define the precmd function
      precmd() {
	if [[ -n $NEWLINE ]]; then
	  echo ""
	fi
      }

      # Define the preexec function
      preexec() {
	export NEWLINE=true
      }

      source /home/zekar/nixos/home-manager/programs/zsh/zekar.zsh-theme
    '';
    syntaxHighlighting = {
      enable = true;
    };
  };
}
