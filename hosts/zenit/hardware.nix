{ config, lib, pkgs, modulesPath, ... }:

{

  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = { 
    device = "/dev/disk/by-uuid/846e9cc0-fe67-4f4b-9ee8-bb02a4d38eb6";
    fsType = "ext4";
  };

  boot.initrd.luks.devices."luks-9313116b-7c3e-4da6-bfbb-1c248b5f669d".device = "/dev/disk/by-uuid/9313116b-7c3e-4da6-bfbb-1c248b5f669d";

  fileSystems."/boot" = { 
    device = "/dev/disk/by-uuid/5DAD-FA73";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  swapDevices = [ 
    { device = "/dev/disk/by-uuid/5b23acb8-756e-4f38-9af1-26f7feb03f29"; }
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eno1.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp5s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
