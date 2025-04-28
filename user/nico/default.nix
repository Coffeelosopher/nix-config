{ config, pkgs, username, ... }: {
  imports = [
    ../../modules/software/shell/zsh.nix
  ];

  users.users."${username}"= {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "private poweruser";
    extraGroups =
    [ "networkmanager" "network" "wheel" "lxd" "docker" "libvirtd" "syncthing" ];
  };
}
