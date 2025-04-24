{ ... }: {
  imports = [
    ./hardware-configuration.nix
    /root/NixConfigCollection/hosts/1blu.nix
  ];

  boot.tmp.cleanOnBoot = true;
  zramSwap.enable = true;
  networking.hostName = "1blu";
  networking.domain = "";
  services.openssh.enable = true;
  users.users.root.openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILRamh4k5eDwjYopD889LnxlEJVFsjJuOeTxvbMSZMMK nico.nicklis@icloud.com"];
  users.users.root.password = "1234";

  nixpkgs.config.allowUnfree = true;
networking = {
  interfaces = {
    ens3.ipv4.addresses = [{
      address = "195.90.219.145";
      prefixLength = 22;
    }];
  };
  defaultGateway = {
    address = "195.90.216.1";
    interface = "ens3";
  };
  nameservers = [ "1.1.1.1" "8.8.8.8" ];
};
}
