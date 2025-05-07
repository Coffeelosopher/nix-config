{ config, lib, pkgs, modulesPath, ... }: {
  imports = [
    # Host specific
    ./network.nix
    ./hardware.nix

    # User
    ../../user/nico/default.nix

    # Modules
    # Base
    ../../modules/base/server.nix

    ## Container
    ../../modules/software/virtualisation/container/docker/default.nix
    ../../modules/software/virtualisation/container/docker/watchtower.nix
    ../../modules/software/virtualisation/container/lxd/default.nix


    # Housekeeping
    ## garbage collection
    ../../modules/houskeeping/gc/default.nix

    # Software
    ## Packages
    ../../modules/software/packages/default.nix

    ## VPN
    ../../modules/software/vpn/tailscale/default.nix
    #../modules/software/vpn/zerotier/default.nix

    ## Editor 
    ../../modules/software/editors/neovim/default.nix

  ];

  # HostName and Stateversion
  networking.hostName = "conan";
  system.stateVersion = "23.11";

  # bootloader setup
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Keymap + Keyboard variant
  services.xserver.xkb = {
    layout = "uk";
    variant = "";
  };

 users.users.root.openssh.authorizedKeys.keys = [
	"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKSBSNv+Trea4+rX7bsRB7J9V49RjWXAkpDTqAos72EC conan@RazerBlade"
	"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILRamh4k5eDwjYopD889LnxlEJVFsjJuOeTxvbMSZMMK nico.nicklis@icloud.com"
 ];
}
