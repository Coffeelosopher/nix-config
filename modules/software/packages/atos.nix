{ config, lib, pkgs, modulesPath, ... }: {

  environment.systemPackages = with pkgs; [

    nixos-generators  # Image builder for using NixOS in the cloud!

    # VM NO WORKEY :( cuz of source website 
    #vmware-workstation
  ];
    #virtualisation.vmware.host.enable = true;
} 
