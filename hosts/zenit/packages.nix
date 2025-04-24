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

}
