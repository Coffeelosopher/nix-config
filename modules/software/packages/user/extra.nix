{ config, pkgs, ... }: 

{
  environment.systemPackages = with pkgs; [

    milkytracker # Tracker music player
    newsflash
    komikku # Manga reader
  	croc
    amberol
  	sshuttle
    keepassxc
    spotifyd
    monero-gui
  ];
}
