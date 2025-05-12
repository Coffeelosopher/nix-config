{ config, pkgs, username, ... } : {

  imports = [ 
    ./default.nix
    #./config/home.nix # unfinished not working home manager config
    #../../modules/services/spotifyd.nix # not working spotifyd daemon
    #../../modules/services/dropbox.nix # broken
    #../../modules/software/vpn/mullvad/default.nix
    #../../modules/services/syncthing/default.nix
    ../flatpak.nix
    
  ];

  # make appimages run with gearlever
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  users.users.${username}= {
   packages = with pkgs; [

        qemu
        quickemu
        #gpu-screen-recorder-gtk # flatpak because nixpkgs is out of date
        losslesscut-bin # cuts videos
        mousai # shazam for linux
        pinokio # ai tool installer?
        easyeffects
        bluetui
        pulsemixer
        timeshift
        darktable # lightroom alternative
        #gimp
        gtk3
        gearlever
        neovide
        koodo-reader # ebook reader
        alacritty
        ghostty
        starship # terminal prompt
        flatpak
        mpv
        gnome-software
        piper # Mouse utility
        firefox
        thunderbird
        vscode
        ffmpeg-full
        #bitwarden # x86 only-use flatpak
        discord
        strawberry
        vlc
        #spotify # use flatpak 
        spotify-player
        obsidian
        obs-studio
        signal-desktop
        drawio
        syncthing
        duplicati
        #etcher # balena etcher, iso flash utility
        anki
        parsec-bin
        bleachbit
        filezilla # FTP Client
        libreoffice
        pdfarranger
        yt-dlp
        mullvad-browser
        libheif # heic image support
        chromium
        # packages to check out
        #nixpkgs-fmt # vscode wirft error, package instlal hat nicht geholfen
        openconnect # anyconnect alternative... bitte?
      ];
  };
}
