{ config, pkgs, lib, ... }:
{
  services.syncthing = {
    enable = true;
    user = "nico";

    configDir = "/home/nico/.config/syncthing";
    dataDir = "/home/nico/.config/syncthing/";
    openDefaultPorts = true;
#    guiAddress = "0.0.0.0:8384";
#    overrideDevices = true;
#    overrideFolders = true;
#    settings = {
#      user = "nico";
#      password = "WX4acPqauWxFbCjd1H2zW60h8Xk8QizMakCLmIxqj0XKyFIyoVoZLtsHT31js3W8";
#
#      devices = {
#        # "NAME"                = { id = "ID"; };
#        "xs-max-iphone" = {
#          id = "XY7MKKA-OG42OX3-MVWJOPK-J3JL2TZ-2LU2NKF-TTITFJR-PHYQKRW-WAY4YA4";
#        };
#
#        "t480" = {
#          id = "S3JOH5I-ARGCXHT-YTKQFEZ-RQN44HH-4GTR7YI-KIO43UL-OXZYNTY-V4475AT";
#        };
#
#        "raspi3b" = {
#          id = "";
#        };
#
#        "windows-gaming" = {
#          id = "";
#        };
#      };
#
#      folders = {
#        "Sync" = {
#          #id = "snhta-7rm3z";
#          path = "/home/nico/Sync";
#          devices = [
#            "1blu"
#            "t480"
#            "raspi3b"
#            "windows-gaming"
#          ];
#        };
#      };
#    };

  };
}

