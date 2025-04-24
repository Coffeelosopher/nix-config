{ modulesPath, lib, ... }: {
  imports = [  ];


  # GPU driver config
  #boot.kernelParams = [ "i915.force_probe=5917" ];

# legacy Xaver config - keep or delete later
#  imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];
#  boot.loader.grub.device = "/dev/vda";
#  boot.initrd.availableKernelModules =
#    [ "ata_piix" "uhci_hcd" "xen_blkfront" "vmw_pvscsi" ];
#  boot.initrd.kernelModules = [ "nvme" ];
#  fileSystems."/" = {
#    device = "/dev/vda2";
#    fsType = "ext4";
#  };
#  nixpkgs.hostPlatform = lib.mkForce "x86_64-linux";

}
