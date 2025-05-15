{ config, lib, pkgs, modulesPath, ... }: 

{
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
    #../../modules/software/virtualisation/container/docker/default.nix
    #../../modules/software/virtualisation/container/docker/watchtower.nix
    #../../modules/software/virtualisation/container/lxd/default.nix


    # Automation
    ## Garbage collection
    #../../modules/houskeeping/gc/default.nix
  ];

  # temp flatpak setup
  services.flatpak.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  wsl.startMenuLaunchers = true;
  networking.hostName = "wsl";
}


