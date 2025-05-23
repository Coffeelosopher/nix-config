{ config, pkgs, username, ... }: 

{
  imports = [ 
    #./default.nix
    #./config/home.nix # unfinished not working home manager config
    #../../modules/services/spotifyd.nix # not working spotifyd daemon
    #../../modules/services/dropbox.nix # broken
    #../../modules/software/vpn/mullvad/default.nix
    #../../modules/services/syncthing/default.nix
  ];

  users.users."${username}"= {
    packages = with pkgs; [

      starship # terminal prompt
      flatpak
      flatpak-builder # not sure if needed
      mpv
      alacritty
      bitwarden-cli
      spotify-player
      #syncthing
      #duplicati
      #borg
      bleachbit
      kdePackages.dolphin
      pdfarranger
      yt-dlp
      libheif # heic image support
      cmus
    ];
  };

}
