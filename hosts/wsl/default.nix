{ config, lib, pkgs, modulesPath, ... }: {

  imports = [
    # System Base/Type
    ../../modules/base/desktop.nix

    # User
    ../../user/wsl/default.nix 

    # Modules
    ## Software
    ### User Packages
    ../../modules/software/packages/user/wsl.nix

    ### System Packages
    ../../modules/software/packages/default.nix

    ## Azure
    ../../modules/software/packages/azure.nix
    
    # Editors
    ## Emacs
    #../../modules/software/editors/emacs.nix

    ## Neovim
    ../../modules/software/editors/neovim/nvchad.nix

    ## Desktop
    #../../modules/software/desktop/gnome.nix

    ## Container
    #../../modules/software/virt/container/docker/default.nix
    #../../modules/software/virt/container/docker/watchtower.nix
    #../../modules/software/virt/container/lxd/default.nix

    # Services
     # Default
    #../../modules/default/default.nix

    # Housekeeping
    ## garbage collection
    #../../modules/houskeeping/gc/default.nix


    ## VPN
    #../../modules/software/vpn/tailscale/default.nix
    #../modules/software/vpn/zerotier/default.nix

    ## Gaming
    #../../modules/software/gaming/steam.nix

  ];

  wsl.startMenuLaunchers = true;
  # HostName and Stateversion
  #networking.hostName = "wsl";
}


