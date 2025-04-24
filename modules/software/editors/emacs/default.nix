{ config, pkgs, ... }:


let
	emacs = with pkgs; (emacsPackagesFor
		emacs-pgtk).emacsWithPackages (
			epkgs: with epkgs; [
						vterm
			]
		);

in {

	fonts.packages = with pkgs; [
			nerdfonts.NerdFontsSymbolsOnly
      nerdfonts.CaskaydiaCode
	]

	nixpkgs.overlays = [
			(import (builtins.fetchTarball {
				url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
			}))
	];

	#services.emacs = {
	#		enable = true;
	#		package = pkgs.emacs-pgtk;
	#};

	environment.systemPackages = with pkgs; [

		 emacs
		 ## Doom dependencies
		 git
		 (ripgrep.override {withPCRE2 = true;})
		 gnutls              # for TLS connectivity
		 libtool             #vterm compile dependency

		 ## Optional dependencies
		 fd                  # faster projectile indexing
		 imagemagick         # for image-dired
		 #(mkIf (config.programs.gnupg.agent.enable)
		 #  pinentry_emacs)   # in-emacs gnupg prompts
		 zstd                # for undo-fu-session/undo-tree compression

		 ## Module dependencies
		 # :checkers spell
		 (aspellWithDicts (ds: with ds; [ en en-computers en-science ]))
		 # :tools editorconfig
		 editorconfig-core-c # per-project style config
		 # :tools lookup & :lang org +roam
		 sqlite
		 # :lang latex & :lang org (latex previews)
		 #texlive.combined.scheme-medium
		 # :lang beancount
		 beancount
		 #unstable.fava  # HACK Momentarily broken on nixos-unstable
		 cmake
		 gcc
		 gnumake
		 isort
		 pipenv
		 python311Packages.nose
		 python311Packages.pytest
		 shellcheck
		 python3
		 xclip
		 nodejs_22
		 scrot			  # screenshot tool: alternatives are maim & gnome-screenshots. no time to check which works best atm

     nixfmt-classic # Nix in init file of doom dependency
	];
}
