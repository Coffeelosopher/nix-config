{ lib, pkgs, Machine, ... }: 

{
  services.flatpak.enable = true;

  # Add a new remote. Keep the default one (flathub)
  services.flatpak.remotes = lib.mkOptionDefault [{
    name = "flathub-beta";
    location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
  }];

  services.flatpak.update.auto.enable = false;
  services.flatpak.uninstallUnmanaged = false;

  # Add here the flatpaks you want to install
  services.flatpak.packages = [
    "com.github.tchx84.Flatseal"
    "md.obsidian.Obsidian"
  ];
}
