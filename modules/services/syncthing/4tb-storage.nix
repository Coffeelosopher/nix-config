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
    "gamingx"
    # External Servers
    # "vinix"
    # Other Devices

  ];
in {
  imports = [ ./default.nix ];

  # !!!
  # Create Symlink on all the devices used below: "r720" "aspire" "steiermarknuc"
  # mkdir /mnt/STORAGE/syncthing
  # chown syncthing:syncthing /mnt/STORAGE/syncthing
  # ln -s /mnt/STORAGE/syncthing /mnt/syncthing 
  # !!!

  services.syncthing.folders = {
    # "FOLDER" = {
    #   id = "FOLDER"; # if none then the name is used as ID
    #   path = "/mnt/syncthing/FOLDER";
    #   devices = syncthingDevices;
    #   versioning = {
    #     type = "staggered";
    #     params = {
    #       cleanInterval = "3600";
    #       maxAge = "5184000";
    #     };
    #   };
    # };
  };
}
