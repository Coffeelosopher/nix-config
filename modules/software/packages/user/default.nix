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

  users.users.${username}= {
    packages = with pkgs; [

      starship # terminal prompt
      neovim
      mpv
      bitwarden-cli
      syncthing
      duplicati
      bleachbit
      yt-dlp

      pdfarranger

      cmus
      spotify-player

      # packages to check out
      #nixpkgs-fmt # vscode wirft error, package instlal hat nicht geholfen
      #openconnect # anyconnect alternative... bitte?
    ];
  };
}
