{ config, pkgs, ... }: {
  imports = [ ./default.nix ];
  services.syncthing = {
    overrideDevices = false;
    overrideFolders = false;
  };
}

