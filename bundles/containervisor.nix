{ config, pkgs, ... }: 

{
  imports = [
    ./default.nix
    ../modules/software/virtualisation/container/lxd/default.nix
    ../modules/software/virtualisation/container/docker/default.nix
    ../modules/software/virtualisation/container/docker/watchtower.nix
  ];
}
