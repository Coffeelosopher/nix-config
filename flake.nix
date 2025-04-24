{
  description = "NixOS flake setup for my personal devices";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {


      # Die Turmstellung, the highest point
      zenit = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/zenit/default.nix
        ];
      };
      

      # Axiom is a self-evident truth a statement that's accepted as true without needing proof. It's the foundation you build logic or systems on.
      axiom = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/axiom/default.nix
        ];
      };


    };
  };
}
