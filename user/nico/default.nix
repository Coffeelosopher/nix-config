{ config, pkgs, ... }: {
  imports = [
    ./variables.nix
    ../../modules/software/shell/zsh.nix
  ];

  #users.users."${config.userName}"= {
  #  packages = with pkgs; [ ];
  #};

  users.users."${config.userName}"= {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "private poweruser";
    extraGroups =
    [ "networkmanager" "network" "wheel" "lxd" "docker" "libvirtd" "syncthing" ];
  };
}
