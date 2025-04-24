{ config, lib, pkgs, modulesPath, ... }: {

  imports = [];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nico = {
    isNormalUser = true;
    description = "Nico Nicklis";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    neovim
    gh
      kdePackages.kate
    #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  git
  zip
  unzip

  ];
}
