{ pkgs, lib, ... }:

{
  imports = [ 
    ../../modules/software/editors/neovim/default.nix
  ];

  # Normal NixOS options …
  networking.hostName = "nixos-vm";
  users.users.alice = { isNormalUser = true; initialPassword = "changeme"; };

  # 1-liner that pulls in open-vm-tools, video + input drivers,
  # time sync service, shared-folders support, etc.                ↓↓↓
  virtualisation.vmware.guest.enable = true;

  # (Optional) If you prefer EFI instead of the default BIOS
  boot.loader.grub = {
    efiSupport = true;
    device = "nodev";
  };

}

