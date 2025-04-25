{ config, pkgs, ... }: {
  imports = [
    # Default
    #../modules/default/default.nix
    ../modules/base/server.nix

    # Housekeeping
    #../modules/houskeeping/alias/nixos.nix
    ../modules/houskeeping/gc/default.nix
    #../modules/houskeeping/scripts/default.nix

    # Software
    ## Packages
    ../modules/software/packages/default.nix
    ## Shell
    ../modules/software/shell/zsh.nix

    ## VPN
    ../modules/software/vpn/tailscale/default.nix

    # Hardware
    #../modules/hardware/hdd-sleep.nix
    
    ## Storage
    #../modules/hardware/storage/portable.nix
  ];
}
