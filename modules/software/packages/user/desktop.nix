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
services.mullvad-vpn.enable = true;
  users.users.${username}= {
   packages = with pkgs; [
      mullvad-vpn

        easyeffects
        bluetui
        pulsemixer
        timeshift
        darktable # lightroom alternative
        #gimp
        gtk3
        gearlever
        neovide
        qemu
        koodo-reader # ebook reader
        alacritty
        starship # terminal prompt
        flatpak
        mpv
        gnome-software
        piper # Mouse utility
        kitty
        alacritty
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

  # EXCLUDE KDE PLASMA PACKAGES
  environment.plasma6.excludePackages = with pkgs.kdePackages; [  ];

# allowing "unsafe" packages overwrite
# nixpkgs.config.permittedInsecurePackages = [
#                "electron-12.2.3"
# ];

 # modified default ZSH 
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];

  # zsh config altered for unstable channel
  programs.zsh = {
    enable = true;
    setOptions = [ "HIST_IGNORE_DUPS" "SHARE_HISTORY" "HIST_FCNTL_LOCK" ];
    enableCompletion = true;
    enableBashCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
        "docker"
        "docker-compose"
        "lxd"
        "wakeonlan"
        "zsh-navigation-tools"
        "zsh-interactive-cd"
        # "tmuxinator"
        # "tmux-cssh"
        # "tmux"
        "timer"
        "systemd"
        "systemadmin" # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/systemadmin
      ];
      theme = "mh";
    };
  };
  # programs.starship.enable = true;
  environment.systemPackages = with pkgs; [ fzf ];

  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-mono
    nerd-fonts.fira-code
  ];
}
