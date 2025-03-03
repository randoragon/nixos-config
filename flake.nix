{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # https://github.com/nix-community/nix-index-database
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, nix-index-database, ... }: let
    system = "x86_64-linux";
    spkgs = nixpkgs-stable.legacyPackages.${system};
  in {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit spkgs; };
      modules = [
        ./hosts/default/configuration.nix
        home-manager.nixosModules.home-manager
        nix-index-database.nixosModules.nix-index
      ];
    };

    nixosConfigurations.nixbox = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit spkgs; };
      modules = [
        ./hosts/nixbox/configuration.nix
        home-manager.nixosModules.home-manager
        nix-index-database.nixosModules.nix-index
      ];
    };

    nixosConfigurations.vps = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit spkgs; };
      modules = [
        ./hosts/vps/configuration.nix
        home-manager.nixosModules.home-manager
      ];
    };
  };
}
