{ config, pkgs, username, ... }: {
	imports = [
		../../modules/software/shell/zsh.nix
	];

  users.users."${username}"= {
		shell = pkgs.zsh;
		description = "wsl default user";
		extraGroups =
		[ "networkmanager" "network" "wheel" "lxd" "docker" "libvirtd" "syncthing" ];
    packages = with pkgs; [ ];

	};
}
