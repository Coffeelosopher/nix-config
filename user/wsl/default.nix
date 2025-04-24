{ config, pkgs, ... }: {
	imports = [
		./variables.nix
		../../modules/software/shell/zsh.nix
	];

	users.users."${config.userName}"= {
		shell = pkgs.zsh;
		description = "wsl default user";
		extraGroups =
		[ "networkmanager" "network" "wheel" "lxd" "docker" "libvirtd" "syncthing" ];
	};

}
