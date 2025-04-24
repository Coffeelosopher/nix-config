{ config, pkgs, ... }:
let
  syncthingDevices = [
    # HBMS Servers
    "hub"
    # "oc"
    # "blu1"
    # "unxi1"
    # "unxi2"
    # Storage Server
    "r720"
    "steiermarknuc"
    "aspire"
    # XR Devices
    "bb"
    "xr-doppeldecker"
    "xr-iphone12"
    # "gamingx"
    # External Servers
    # "vinix"
    # Other Devices
  ];
in {
  imports = [ ./default.nix ];

  # !!!
  # Create Symlink on all the devices used below: "hub" "r720" "aspire" "steiermarknuc"
  # mkdir /mnt/STORAGE/syncthing
  # chown syncthing:syncthing /mnt/STORAGE/syncthing
  # ln -s /mnt/STORAGE/syncthing /mnt/syncthing 
  # !!!

  services.syncthing.folders = {
    "xr-photos" = {
      id = "xr-photos"; # if none then the name is used as ID
      path = "/mnt/syncthing/xr-photos";
      devices = syncthingDevices;
      versioning = {
        type = "staggered";
        params = {
          cleanInterval = "3600";
          maxAge = "5184000";
        };
      };
    };
    "xr-downloads" = {
      id = "xr-downloads"; # if none then the name is used as ID
      path = "/mnt/syncthing/xr-downloads";
      devices = syncthingDevices;
      type = "receiveencrypted";
    };
    "xr-desktop" = {
      id = "xr-desktop"; # if none then the name is used as ID
      path = "/mnt/syncthing/xr-desktop";
      devices = syncthingDevices;
      type = "receiveencrypted";
    };
    "xr-documents" = {
      id = "xr-documents"; # if none then the name is used as ID
      path = "/mnt/syncthing/xr-document";
      devices = syncthingDevices;
      type = "receiveencrypted";
    };
  };
}
