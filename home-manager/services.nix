{ specialArgs, config, pkgs, inputs, ... }:
{
  imports = [
    ./programs/sxhkd.nix
  ];
  services = {
    syncthing = {
      enable = true;
      tray = true;
    };
  };

  dconf.settings = {
  "org/virt-manager/virt-manager/connections" = {
    autoconnect = ["qemu:///system"];
    uris = ["qemu:///system"];
  };
};
}
