{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [

	sudo
	zsh
	bash
	rsync
	eza # ls and other basic commands
	nano
	vim
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
	fd
	ack
	#python39 # added python (for sshuttle)
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

	# Other System Stuff
	multipath-tools
	cryptsetup
	btrfs-progs
	smartmontools
	sshfs
  ];
}
