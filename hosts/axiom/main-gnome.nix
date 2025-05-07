{ config, lib, pkgs, modulesPath, ... }: {
  imports = [
    # Host System
    #./configuration.nix # Xaver Thinksync
    #./hardware.nix      # Xaver Drives
    #./network.nix

    # Modules
    #../../bundles/default.nix
    ../../modules/software/virtualisation/container/docker/default.nix
    ../../modules/software/virtualisation/container/docker/watchtower.nix
    ../../modules/software/desktop/gnome.nix
    
    ../../modules/software/editors/emacs.nix # Experimental not working yet
  
    ## Houskeeping
    #../../modules/houskeeping/autoupgrade/reboot.nix

    # Services
    #../../modules/services/netdata.nix
    #../../modules/software/vpn/mullvad/default.nix
    # User
    ../../user/privileged/desktop.nix

    #Syncthing
    ../../modules/services/syncthing/default.nix


    ##Experiments Move later
     # Default
    ../../modules/default/default.nix

    # Housekeeping
    #../modules/houskeeping/alias/nixos.nix
    ../../modules/houskeeping/gc/default.nix
    #../modules/houskeeping/scripts/default.nix

    # Software
    ## Packages
    ../../modules/software/packages/default.nix

    #../../modules/software/shell/tmux/default.nix
    #../../modules/software/shell/neovim/default.nix
    ## VPN
    ../../modules/software/vpn/tailscale/default.nix
    #../modules/software/vpn/zerotier/default.nix

    # Hardware
    #../../modules/hardware/hdd-sleep.nix
    
    ## Storage
    #../../modules/hardware/storage/portable.nix
  ];
  # tempoary bootloader setup 
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-f16ec2b7-de15-4b99-85dd-509e798cb3a7".device = "/dev/disk/by-uuid/f16ec2b7-de15-4b99-85dd-509e798cb3a7";
  boot.initrd.luks.devices."luks-f16ec2b7-de15-4b99-85dd-509e798cb3a7".keyFile = "/crypto_keyfile.bin";

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Thunderbolt daemon
  services.hardware.bolt.enable = true;	

  # GPU driver config 
  boot.kernelParams = [ "i915.force_probe=5917" ];

  # HostName and Stateversion
  networking.hostName = "t480";
  system.stateVersion = "23.05";

  # Keymap + Keyboard variant
  services.xserver = {
    layout = "gb";
    xkbVariant = "";
  };

# Printer config
  services.printing = {
    enable = true;
    drivers = [ pkgs.hplipWithPlugin];
  };
  services.avahi = {
      enable = true;
      nssmdns = true;
      openFirewall = true;
      publish = {
        enable = true;
        addresses = true;
        userServices = true;
      };
    };

### Misc.
#  # Enable the X11 windowing system.
#  services.xserver.enable = true;

#  # Enable sound with pipewire.
#  sound.enable = true;
#  hardware.pulseaudio.enable = false;
#  security.rtkit.enable = true;
#  services.pipewire = {
#    enable = true;
#    alsa.enable = true;
#    alsa.support32Bit = true;
#    pulse.enable = true;
#    # If you want to use JACK applications, uncomment this
#    #jack.enable = true;
#
#    # use the example session manager (no others are packaged yet so this is enabled by default,
#    # no need to redefine it in your config for now)
#    #media-session.enable = true;
#  };
#
#  # Enable touchpad support (enabled default in most desktopManager).
#  # services.xserver.libinput.enable = true;
#
#  };
}
