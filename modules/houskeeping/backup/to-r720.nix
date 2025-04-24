{ config, pkgs, ... }: {

  services.restic.backups = {
    hbms-nixos = {
      initialize = true;
      repositoryFile = "/etc/nixos/restic/default-backup-to-r720.repository";
      passwordFile = "/etc/nixos/restic/default-backup-to-r720.password";
      # rest:http://hbms-nixos:PASSWD@100.64.0.22:8000/hbms-nixos
      # rest:http://hbms-nixos:PASSWD@[fca1:98e2:62a9:f6f7:e7ab::1]:8000/hbms-nixos

      paths = [
        "/etc/ssh"
        "/etc/NetworkManager/system-connections"
        "/root/docker"
        # "/home"
        "/var/lib/docker/volumes"
        "/var/lib/syncthing/.config"
        "/var/lib/restic"
        "/var/lib/backup"
        "/var/lib/tailscale"
        "/var/lib/zerotier-one"
        "/var/lib/private/uptime-kuma"
        "/var/lib/nixos"
        "/var/lib/nextcloud"
      ];
      exclude = [
        # "/home/*/.cache"
        # "/home/*/.tldrc"
        # "/home/*/exclude"
        # "/root/.tldrc"
        # "/root/.cache"
        # "/root/exclude"
      ];
      timerConfig = {
        OnCalendar = "hourly";
        RandomizedDelaySec = "30m";
      };
    };
  };
}
