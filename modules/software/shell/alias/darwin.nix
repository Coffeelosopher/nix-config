{ config, pkgs, ... }: {

  imports = [ ./default.nix ];

  environment.shellAliases = {

    # Darwin ( OS ) update
    nixos-rebuild = "darwin-rebuild";
    switch = "darwin-rebuild switch && softwareupdate -l";
    upgrade = "darwin-rebuild switch && softwareupdate -i -a";
    clean = ''
      nix-collect-garbage -d &&  
            brew cleanup --prune=all && 
            rm -rf $(brew --cache) && 
            rm -rf ~/.Trash/* 
    '';

    #  Iso generation
    generate-iso =
      "nixos-generate -f iso --flake git+ssh://git@gitea.hostedbymyself.de:2022/xaver.russ/nixconfig.git#nixos ";

    # Command overwrites
    chmod = "chmod -R ";
    chown = "chown -R ";
    cp = "rsync -ah --progress ";
    syncthing = "open http://localhost:8384";

    # Ping Tricks
    ping-multicast = "ping6 -c 5 ff02::1%en0";

    # Network fixes
    dns-set-1-1-1-1 =
      "networksetup -setdnsservers Tailscale 0.0.0.0 && networksetup -setdnsservers Wi-Fi 1.1.1.1";
    thunderbolt-restart = ''
      networksetup -setnetworkserviceenabled thunderbolt off &&
      networksetup -setnetworkserviceenabled thunderbolt on
    '';
  };
}

