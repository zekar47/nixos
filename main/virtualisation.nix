{ config, pkgs, ... }:
{
  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerSocket.enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };

    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;

    waydroid.enable = true;
  };

  programs.virt-manager.enable = true;
}
