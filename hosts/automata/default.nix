{ config, pkgs, ... }:
# PublicSSH root
# ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCPznlxFnV99TRNcYv1e5/xkOoHchWyTrV9Xaa8cne4TUBv2MSz1WqB4+thiXcP4bMBQp4iPJtUj8RWxqRDZromRWKkmudltqDL/ub0MitpIDMg6yOuMa392TI9yHJMSlQ1jUMXKuYcdm2mVwqZPaEG6HpDsgFgU6F4ZuIa1G+aRgLnB2OSV6++SodxXPJihqr549G5Nw9m3Q8udDXrOvBmyfxZhbFWjc61++xLFRtvDa7zcQeLIC7qzecLTaU4knvgSunift3uOHpkLdi+H+zdVXf4LHzUMQroMhH1Nqhu0zKCCQF2dtFJq3r7odt6qZm2SsmkC0wyttYpIpf3STRxjTK9iRIfqiPz1KSvEjP/dr0J6/uiC+XM4teHBkczLtp+8pfeK/tUqBPeuRWwFZrNvNel/jUW3grDNXctHUa/XgcXTmctshgakxJ3i/u67HA6CzQZ8+YfEB/BHudauRznw9e9DQG4lh4YBp4GFgcGs9Xl5mKn/KKBm95dww8nlLs= root@unxi1
{
    imports = [
        #hardware import to skip manual filesystem configuration
        /etc/nixos/hardware-configuration.nix

        ../configs/default.nix # SSH, allow unfree, local, timezone
        ../configs/autoupgradereboot.nix
        ../configs/tailscale.nix
        ../virt/docker.nix
        ../packages/base.nix
        ../storage/portable.nix
        ../user/nico/nico.nix
        ../services/nextcloud.nicklis.cloud.nix
        #../virt/libvirt.nix
    ];

    # Bootloader test
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;


    # hostName
    networking.hostName = "automata";
    system.stateVersion = "22.11";

    # Keymap
    services.xserver = {
        layout = "gb";
        xkbVariant = "";
    };
  
}
