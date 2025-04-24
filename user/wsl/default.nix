{ config, pkgs, amogus, ... }: {
	imports = [
		./variables.nix
		../../modules/software/shell/zsh.nix
	];

#	users.users."${config.userName}"= {
  users.users."${amogus}"= {
		shell = pkgs.zsh;
		description = "wsl default user";
		extraGroups =
		[ "networkmanager" "network" "wheel" "lxd" "docker" "libvirtd" "syncthing" ];

   packages = with pkgs; [
     inkscape 
   ];
	};

}
