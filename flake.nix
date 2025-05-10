{
  description = "NixOS flake setup for my personal devices";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, determinate, nixos-wsl, nixos-hardware, home-manager,... }@inputs: {

    nixosConfigurations = {
      
      zenit = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/zenit/default.nix
            determinate.nixosModules.default
          ];
      };
        
      #axiom = nixpkgs.lib.nixosSystem {
      #  system = "x86_64-linux";
      #  modules = [
      #    ./hosts/axiom/default.nix
      #    determinate.nixosModules.default
      #    nixos-hardware.nixosModules.lenovo-thinkpad-t480 # check if path is correct
      #  ];
      #};

      conan = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/conan/default.nix
          determinate.nixosModules.default
          #home-manager.nixosModules.home-manager
          #  {
          #    home-manager.useGlobalPkgs = true;
          #    home-manager.useUserPackages = true;
          #    #home-manager.users.${variables.username}= ./home.nix;
          #    home-manager.users.joe= ./home.nix;

          #    # Optionally, use home-manager.extraSpecialArgs to pass
          #    # arguments to home.nix
          #  }
        ];
      };

      mblu = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/mblu/default.nix
          determinate.nixosModules.default
        ];
      };

      wsl = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/wsl/default.nix
          determinate.nixosModules.default

          nixos-wsl.nixosModules.default
          {
            system.stateVersion = "24.11";
            wsl.enable = true;
          }
        ];
      };
    };
  };
}

