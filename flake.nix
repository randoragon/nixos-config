{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, ... }: let
    system = "x86_64-linux";
    spkgs = nixpkgs-stable.legacyPackages.${system};
  in {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit spkgs; };
      modules = [
        ./hosts/default/configuration.nix
        home-manager.nixosModules.home-manager
      ];
    };

    nixosConfigurations.nixbox = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit spkgs; };
      modules = [
        ./hosts/nixbox/configuration.nix
        home-manager.nixosModules.home-manager
      ];
    };
  };
}
