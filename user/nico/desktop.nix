{ config, pkgs, ... }: {
  imports = [ 
    ./default.nix
    ../../modules/software/vpn/mullvad/default.nix
    ../../modules/services/syncthing/default.nix
  ];

  users.users.nico = {
   packages = with pkgs; [ ];
  };
}
