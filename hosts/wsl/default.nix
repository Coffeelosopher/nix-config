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
    ## Neovim
    ../../modules/software/editors/neovim/nvchad.nix

    ## Container
    #../../modules/software/virt/container/docker/default.nix
    #../../modules/software/virt/container/docker/watchtower.nix
    #../../modules/software/virt/container/lxd/default.nix


    # Housekeeping
    ## garbage collection
    #../../modules/houskeeping/gc/default.nix

  ];

  wsl.startMenuLaunchers = true;
  # HostName and Stateversion
  #networking.hostName = "wsl";
}


