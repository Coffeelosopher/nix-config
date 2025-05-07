{ config, pkgs, variables, ... }: {

  environment.shellAliases = {
    # NIXOS Build
    nix          = "nix --extra-experimental-features ' nix-command flakes ' ";
    flake-update = "nix flake update --commit-lock-file && git push";
    nixos-rebuild-flake = "nixos-rebuild switch --flake 'github:coffeelosopher/nix-config#${variables.hostname}' --refresh";
    testung = "echo '${variables.var1}, ${variables.var2}, ${variables.data1}'";

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

  };
}

