{
  description = "NixOS flake setup for my personal devices";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
  };

  outputs = { self, nixpkgs, determinate, ... }@inputs: {
    nixosConfigurations = {


      # Die Turmstellung, the highest point
      zenit = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/zenit/default.nix
          determinate.nixosModules.default
        ];
      };
      

      # Axiom is a self-evident truth a statement that's accepted as true without needing proof. It's the foundation you build logic or systems on.
      axiom = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/axiom/default.nix
        ];
      };

      wsl = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/wsl/default.nix
        ];
      };

    };
  };
}
