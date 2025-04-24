{ config, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
  };

  environment.systemPackages = with pkgs; [
    ripgrep
    gcc
    gnumake
    zig
    luarocks
    #lua
    lua51Packages.lua
    lua-language-server
    lazygit
    xclip
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-mono
  ];

}
