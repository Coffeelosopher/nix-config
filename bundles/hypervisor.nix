{ config, pkgs, ... }: {
  imports = [
    # Hypervisor includes container
    ./containervisor.nix
    ## VM
    ../modules/software/virt/vm/libvirt.nix
  ];
}
