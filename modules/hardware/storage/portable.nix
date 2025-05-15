{ config, pkgs, ... }: 

{
  fileSystems."/mnt/400sd1" = {
    label = "400sd1";
    options = [ "noatime" "nodiratime" "discard" "auto" "nofail" ];
  };
  fileSystems."/mnt/lte" = {
    label = "lte";
    options = [ "noatime" "nodiratime" "discard" "auto" "nofail" ];
  };
  fileSystems."/mnt/speedy" = {
    label = "speedy";
    options = [ "noatime" "nodiratime" "discard" "auto" "nofail" ];
  };
}
