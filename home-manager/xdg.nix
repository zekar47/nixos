{ specialArgs, config, pkgs, inputs, ... }:
{
  xdg = {
    mimeApps = {
      enabled = true;
      defaultApplications = {
      };
    };
  };
}
