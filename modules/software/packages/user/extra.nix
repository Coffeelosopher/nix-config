{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [

      # cool i guess
        ghostty
        motrix
        milkytracker # Tracker music player
        newsflash
        komikku # Manga reader

      # useful i guess
      	croc
        amberol
      	sshuttle
      	tor
        keepassxc
        spotifyd
        monero-gui
  ];
}
