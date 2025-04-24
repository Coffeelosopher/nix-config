{ config, lib, pkgs, modulesPath, ... }: {

  _module.args = {
    username = "nixos";
  };

  imports = [
    # System Base/Type
    ../../modules/base/desktop.nix

    # User
    ../../user/wsl/default.nix 

    ## Software
    ### User Packages
    ../../modules/software/packages/user/wsl.nix

    ### System Packages
    ../../modules/software/packages/default.nix

    ## Azure
    ../../modules/software/packages/azure.nix
    
    # Editors
    ## Neovim
    ../../modules/software/editors/neovim/default.nix

    # Container
    #../../modules/software/virt/container/docker/default.nix
    #../../modules/software/virt/container/docker/watchtower.nix
    #../../modules/software/virt/container/lxd/default.nix


    # Automation
    ## Garbage collection
    #../../modules/houskeeping/gc/default.nix
  ];

  wsl.startMenuLaunchers = true;
  networking.hostName = "wsl";
}


