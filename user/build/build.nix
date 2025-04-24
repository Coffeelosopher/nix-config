{ config, pkgs, ... }:
{
  users.users.build = {
    isNormalUser = false;
    description = "build user";
    extraGroups = [];
    openssh.authorizedKeys.keys = [ 
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILRamh4k5eDwjYopD889LnxlEJVFsjJuOeTxvbMSZMMK nico.nicklis@icloud.com"
    ];
  };
}