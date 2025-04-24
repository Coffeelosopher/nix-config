{ config, pkgs, ... }: {

  environment.shellAliases = {
    # NIXOS Build
    nix          = "nix --extra-experimental-features ' nix-command flakes ' ";
    flake-update = "nix flake update --commit-lock-file && git push";

    # SSH Config Stuff
    jssh     = "ssh -J hub";
    jsh      = "jssh";
    sshuttle = "sshuttle -N -v --disable-ipv6  ";
    sshfs    = "sshfs -o reconnect,sshfs_sync ";

    # DSH Config
    dsh    = "tmux-cssh";
    dshnix = "tmux-cssh bb blu1 hub oc-arm r720 unxi{1..2} aspire steiermarknuc vinix";
    dshall = "dshnix  "; # and others

    # My Command overwrites
    lsblk = "lsblk -o NAME,LABEL,SIZE,TYPE,MOUNTPOINTS";
    ncdu  = "gdu";
    gdu   = "gdu -x";
    gdud  = "gdu -d";
    free  = "free -h";
    watch = "watch -n 0.5 ";
    # df = "dfc -T -t -overlay,tmpfs,devtmpfs";
    # disk = "df";
    duf  = "duf -hide-fs tmpfs,devtmpfs,vfat -theme ansi";
    df   = "duf";
    disk = "duf ./";
    find = "fd -a";
    btop = "btop -p 0 -t";
    bat  = "bat --theme Coldark-Cold -pn";
    nano = "nano --tabstospaces --showcursor --autoindent --linenumbers --backup --backupdir=/tmp/";
    ssh  = "ssh -o 'ConnectionAttempts 1800'";

    # Croc Relay
    croc = "croc --relay hub.server.hostedbymyself.de --pass xXEr4mNpTzTVnnos";

    # Tailscale 
    ts     = "tailscale";
    tsi    = "ts ip";
    tsip   = "tsi";
    tss    = "ts status";
    tssg   = "tss | grep ";
    tssr   = "tssg relay";
    tssd   = "tssg direct";
    tsf    = "ts file";
    tsfcp  = "tsf cp";
    tsfget = "tsf get";
    tsp    = "ts ping";
    tsn    = "ts netcheck";
    tsnc   = "tsn";

    #Media
    # YT-dlp
    # Disabled Options: --downloader aria2c
    yt-download-video       = "yt-download-video-1080";
    yt-dlp-defaults         = "yt-dlp -a - -N 8 -P 'temp:/tmp' --embed-metadata --embed-thumbnail --restrict-filenames --sponsorblock-mark all --sponsorblock-remove sponsor,selfpromo";
    yt-dlp-defaults-video   = "yt-dlp-defaults --merge-output-format mp4";
    yt-download-video-max   = "yt-dlp-defaults-video -S 'vcodec:h265'";
    yt-download-video-480   = "yt-dlp-defaults-video -S 'vcodec:h265,res:480'";
    yt-download-video-1080  = "yt-dlp-defaults-video -S 'vcodec:h265,res:1080'";
    yt-download-audio       = "yt-dlp-defaults -x --audio-format mp3 --audio-quality 0";
  };
}

