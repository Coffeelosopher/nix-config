{ config, pkgs, ... }:

{
  imports = [ ./flatpak.nix ];

  # Kitty themes: git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes

  # Services
  # services = {
  #   xserver = {
  #     enable = true;
  #     displayManager.sddm = {
  #       enable = true;
  #       settings = { General = { DisplayServer = "wayland"; }; };
  #     };
  #   };
  # };




  programs = {
    hyprland = {
      enable = true;
      #nvidiaPatches = true;
      xwayland = {
        hidpi = true;
        enable = true;
      };
    };
    waybar = { enable = true; };
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [ thunar-archive-plugin thunar-volman ];
    };
  };

  # XDG Portals
  # xdg = {
  #   autostart.enable = true;
  #   portal = {
  #     enable = true;
  #     extraPortals = [ pkgs.xdg-desktop-portal pkgs.xdg-desktop-portal-gtk ];
  #   };
  # };

  # Hardware
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      # extraPackages = with pkgs; [ vaapiVdpau libvdpau-va-gl ];
      # extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
      # setLdLibraryPath = true;
    };
  };

  environment.systemPackages = with pkgs; [


    hyprland
    hyprpicker
    hyprpaper
    seatd
    # Flatpak file permissions
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    font-awesome
    ranger
    wl-clipboard
    wf-recorder
    wlogout
    ffmpegthumbnailer
    imagemagick
    swaylock-effects
    ripgrep
    ffmpeg
    networkmanagerapplet	
    discord
    gnome.gedit
    emacs
    signal-desktop
    telegram-desktop
    obsidian
    element-desktop-wayland
    thunderbird
    keepassxc
    bitwarden
    vscode
    polkit
    cliphist
    brightnessctl
    envsubst # dependency waybar config
    # Notifications
    dunst
    libnotify
    # App launcher todo: wofi, rofi, rofi-wayland?
    wofi
    rofi-emoji
    # Music
    mpv
    mpd
    ncmpcpp
    spotify
    
    # Audio Control
    pavucontrol
    pamixer
    playerctl
    # Audio Backend
    wireplumber
    # Browser
    firefox-wayland
    # Power managment
    powertop
    tlp
    # Unsure if right
    xfce.tumbler 
    wtype 
    colord
    qt6.qtwayland
    xwayland
    libsForQt5.qt5ct
    catppuccin-kvantum
    eza
    # Terminal Emulators
    wezterm
    kitty
    alacritty
    #Status bar
    waybar
    glib
    (waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    }))
    # Themes
    catppuccin-gtk
    apple-cursor
    # Fonts
    comic-mono
    # File Managment 
    gnome.nautilus
    xfce.thunar
    xfce.thunar-volman
    nextcloud-client
    nextcloud27
    # bluetooth
    bluez
    blueman
    # screenshot tools 
    grim    
    swappy  
    slurp
    #wallpaper thingy
    viewnior
    feh
    swww  
    copyq
    weston
    swaybg
    pipewire
    mako
    kitty-themes
    polkit_gnome
    # libva-utils
    fuseiso
    udiskie
    gnome.adwaita-icon-theme
    gnome.gnome-themes-extra
    # nvidia-vaapi-driver
    gsettings-desktop-schemas
    swaynotificationcenter
    wlr-randr
    ydotool
    hyprland-share-picker
    hyprland-protocols
    swayidle
    swaylock
    rofi-wayland
    swww
    grim
    xdg-utils
    xdg-desktop-portal
    qt5.qtwayland
    qt6.qmake
    adwaita-qt
    adwaita-qt6   
  ];
}
