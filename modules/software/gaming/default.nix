{ config, pkgs, ... }: {
  imports = [ 
  ./steam.nix
  ./lutris.nix
  ./minecraft.nix
  ];

}
