{ config, lib, pkgs, modulesPath, ... }: {
  # Custom Service
  services.syncthing.folders = {
    "yt-media" = {
      id = "ufbyj-hnscz";
      path = "/var/lib/syncthing/yt-media";
      devices = [
        "1blu"
        # XR Devices
        "xr-doppeldecker"
        "xr-iphone12"
        "bb"
      ];
      versioning = {
        type = "trashcan";
        params.cleanoutDays = "7";
      };
    };
  };
}
