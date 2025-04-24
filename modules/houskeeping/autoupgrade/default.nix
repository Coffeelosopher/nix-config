{ config, pkgs, ... }: {
  system.autoUpgrade = {
    enable = true;
    persistent = true;
    dates = "04:40"; # Is Default
    randomizedDelaySec = "20m";
    flake =
      "git+ssh://git@gitea.hostedbymyself.de:2022/xaver.russ/nixconfig.git";
    flags = [ "--refresh" "--no-write-lock-file" ];
  };
}
