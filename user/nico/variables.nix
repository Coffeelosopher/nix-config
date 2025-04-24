{ config, pkgs, ... }: {
	imports = [
		../options.nix
	];
	config = {
		userName = "nico";
	};
}
