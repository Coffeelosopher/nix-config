
{ config, pkgs, ... }:
{
    services.croc = {
        enable = true;
        pass = "xXEr4mNpTzTVnnos";
        openFirewall = true;
        ports = [
            9009
            9010
            9011
            9012
            9013
        ];
    };
}

