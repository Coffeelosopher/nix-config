{ config, pkgs, ... }: 

{
  imports = [ ./default.nix ];
  virtualisation.docker = { autoPrune = { flags = [ "--volumes" ]; }; };
}
