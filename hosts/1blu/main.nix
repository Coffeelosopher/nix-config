{ config, lib, pkgs, modulesPath, ... }: {
  imports = [
    # Host System
    #./configuration.nix # xaver Thinksync
    #./hardware.nix      # Xaver Drives
    ./network.nix
    ./proxy.nix          # nginx reverse proxy

    # Modules
    ../../bundles/default.nix
    ../modules/software/virt/container/docker/default.nix
    ../modules/software/virt/container/docker/watchtower.nix

    ## Houskeeping
    ../../modules/houskeeping/autoupgrade/reboot.nix
    #../../modules/houskeeping/backup/to-r720.nix

    # Services
    #../../modules/services/transmission.nix
    #../../modules/services/netdata.nix
  

    #Syncthing
    #../../modules/services/syncthing/default.nix
    # ../../modules/services/syncthing/1tb-storage.nix
    # ../../modules/services/syncthing/4tb-storage.nix
  ];

  # HostName and Stateversion
  networking.hostName = "1blu";
  system.stateVersion = "23.05";

  # Keymap + Keyboard variant
  services.xserver = {
    layout = "gb";
    xkbVariant = "";
  };
}
