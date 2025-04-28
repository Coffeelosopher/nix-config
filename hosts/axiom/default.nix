{ config, lib, pkgs, modulesPath, ... }:

{
  _module.args = {
    username = "nico";
  };

  # SSHD
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      #X11Forwarding = true;
    };
  };

  users.users.nico.openssh.authorizedKeys.keys = [
	"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILRamh4k5eDwjYopD889LnxlEJVFsjJuOeTxvbMSZMMK nico.nicklis@icloud.com" ];

  imports = [
    # Host specific
    #($modulesPath + "/lenovo/thinkpad/t480/default.nix")

    # System Base/Type
    ../../modules/base/desktop.nix

    # User
    ../../user/nico/default.nix

    # Modules
    ## Software
    ### System Packages
    ../../modules/software/packages/default.nix
    ### User Packages
    #../../modules/software/packages/user/wsl.nix
    ../../modules/software/packages/user/desktop.nix

    # Editors
    ## Neovim
    ../../modules/software/editors/neovim/default.nix

    ## Desktop
    ../../modules/software/desktop/kde.nix

    ## VPN
    ../../modules/software/vpn/tailscale/default.nix
    #../modules/software/vpn/zerotier/default.nix

    ## Gaming
    ../../modules/software/gaming/default.nix

    ## Container
    #../../modules/software/virtualisation/container/docker/default.nix
    #../../modules/software/virtualisation/container/docker/watchtower.nix
    #../../modules/software/virtualisation/container/lxd/default.nix

    # Services
     # Default
    #../../modules/default/default.nix

    # Housekeeping
    ## garbage collection
    #../../modules/houskeeping/gc/default.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-a64f19c4-74ca-40ff-bde7-3332545856a9".device = "/dev/disk/by-uuid/a64f19c4-74ca-40ff-bde7-3332545856a9";
  networking.hostName = "axiom"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "uk";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}


