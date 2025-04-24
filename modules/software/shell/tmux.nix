{ config, pkgs, ... }: {

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    historyLimit = 5000;
    keyMode = "vi";
    newSession = true;
    secureSocket = false; # Not so secure but enabled user logout
    shortcut = "b";
    plugins = [
      pkgs.tmuxPlugins.sensible
      pkgs.tmuxPlugins.online-status
      pkgs.tmuxPlugins.battery
    ];
    # customPaneNavigationAndResize = false;
    extraConfig = "";

  };
}
