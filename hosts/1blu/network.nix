{ config, lib, pkgs, ... }: 

{
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
