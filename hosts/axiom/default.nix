{ config, lib, pkgs, modulesPath, Machine, ... }:

{
  imports = [
    # Host specific 
    ./hardware.nix
    ./variables.nix

    # System Base/Type
    ../../modules/base/desktop.nix

    # User
    ../../user/privileged/default.nix

    # Software
    ## System Packages
    ../../modules/software/packages/system/complete.nix

    ### User Packages
    ../../modules/software/packages/user/desktop.nix

    ## Desktop
    ../../modules/software/desktop/kde.nix

    ## Neovim
    ../../modules/software/editors/neovim/default.nix

    # Housekeeping
    ## garbage collection
    ../../modules/houskeeping/gc/default.nix

    ## VPN
    ../../modules/software/vpn/tailscale/default.nix
    ../../modules/software/vpn/mullvad/default.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "${Machine.hostname}";

  system.stateVersion = "25.05";

  ### Experiments ###
  # Custom Kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;
}


