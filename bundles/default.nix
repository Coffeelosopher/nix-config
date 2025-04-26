{ config, pkgs, ... }: {
  imports = [
    # Base
    ../modules/base/server.nix

    # Software
    ## Packages
    ../modules/software/packages/default.nix

    ## Shell
    ../modules/software/shell/zsh.nix

    ## VPN
    ../modules/software/vpn/tailscale/default.nix

    # Housekeeping
    ../modules/houskeeping/gc/default.nix
  ];
}
