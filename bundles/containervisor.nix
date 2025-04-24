{ config, pkgs, ... }: {
  imports = [
    ./default.nix
    ../modules/software/virt/container/lxd/default.nix
    ../modules/software/virt/container/docker/default.nix
    ../modules/software/virt/container/docker/watchtower.nix
  ];
}
