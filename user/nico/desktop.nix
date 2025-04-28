{ config, pkgs, username, ... }: {
  imports = [ 
    ./default.nix
  ];

  users.users.username = {
   packages = with pkgs; [ ];
  };
}
