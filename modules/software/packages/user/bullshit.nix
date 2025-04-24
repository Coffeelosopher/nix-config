{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [

    thefuck
    helix # texteditor... vim aber anders
  ];
}
