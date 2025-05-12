{ config, pkgs, ... }: 

{
  environment.systemPackages = with pkgs; [

	sudo
	zsh
	bash
	rsync
	eza # ls and other basic commands
  zip
  unzip
	nano
	vim
  neovim
	git
	git-annex
	gh
  appimage-run
	nixos-generators
	nixos-option
	parted
	pciutils
	dig
	curl
	wget
	zoxide
	starship
	htop
	btop
	glances
	gdu
	fzf
	zellij
	fastfetch
	tree
	pstree
	busybox
	magic-wormhole
	iperf3
	autossh
	speedtest-cli
	lm_sensors
	links2
	jq
	inetutils
	aria
	dfc
	duf
	trash-cli
	tldr
	#fd
	ack
  python3
	restic
	jdupes
	ventoy
	powertop
	netcat-gnu
	ranger
	yazi
	ncdu
	bat
	bat-extras.batman  	
  ntfs3g

	# Other System Stuff
	multipath-tools
	cryptsetup
	btrfs-progs
	smartmontools
	sshfs
  ];
}
