{ config, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    configure = {
      customRC = ''
        " here your custom configuration goes!
      '';
      # Plugins
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [
          # Use NVchad as default for now 
          nvchad
          nvchad-ui
          # nvchat-extensions
        ];
      };
    };
  };
}
