{ pkgs, userName, ... }: {


  users.users.${userName}= {
    packages = with pkgs; [
      flatpak
      gnome-software
    ];
  };

  systemd.services.configure-flathub-repo = {
    wantedBy = [ "default.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
}
