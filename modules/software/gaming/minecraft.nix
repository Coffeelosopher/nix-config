{ config, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    prismlauncher
    zulu21 # java 21
  ];  
}
