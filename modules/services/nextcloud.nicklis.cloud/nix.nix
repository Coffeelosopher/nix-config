# Included in r720
# Docker compose setup
{ config, pkgs, ... }:
{
    systemd.timers."nextcloud.hostedbymyself.de-cron" = {
        wantedBy = [ "timers.target" ];
        timerConfig = {
            OnBootSec = "5m";
            OnUnitActiveSec = "1m";
            Unit = "nextcloud.hostedbymyself.de-cron.service";
        };
    };
    systemd.services."nextcloud.hostedbymyself.de-cron" = {
        script = ''
            /run/current-system/sw/bin/docker exec -u 33 hbms-nextcloud-app-1 php /var/www/html/cron.php
        '';
        serviceConfig = {
            Type = "oneshot";
            User = "root";
        };
    };
}

