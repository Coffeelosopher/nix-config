{ config, pkgs, userName, ... }: {
  imports = [ 
    #./default.nix
    #./config/home.nix # unfinished not working home manager config
    #../../modules/services/spotifyd.nix # not working spotifyd daemon
    #../../modules/services/dropbox.nix # broken
    #../../modules/software/vpn/mullvad/default.nix
    #../../modules/services/syncthing/default.nix
  ];

  users.users.${userName}= {
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

  ## EXPERIMENTS, move later TODO ## 

# allowing "unsafe" packages overwrite
#nixpkgs.config.permittedInsecurePackages = [
#               "electron-12.2.3"
#               "electron-19.1.9"
#];
}
