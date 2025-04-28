{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [

    thefuck
    motrix
    helix         # texteditor... vim aber anders
    tor
  ];
}
