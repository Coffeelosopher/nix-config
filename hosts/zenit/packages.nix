{ config, lib, pkgs, modulesPath, ... }: {

  imports = [];

  users.users.nico = {
    isNormalUser = true;
    description = "Nico Nicklis";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ inkscape ];
  };
}
