{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    rsid3.url = "github:randoragon/rsid3";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # https://github.com/nix-community/nix-index-database
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, ... }@inputs: let
    system = "x86_64-linux";
    spkgs = inputs.nixpkgs-stable.legacyPackages.${system};
    rsid3 = inputs.rsid3.packages.${system}.default;
  in {
    nixosConfigurations.default = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = { inherit spkgs; inherit rsid3; };
      modules = [
        ./hosts/default/configuration.nix
        inputs.home-manager.nixosModules.home-manager
        inputs.nix-index-database.nixosModules.nix-index
      ];
    };

    nixosConfigurations.nixbox = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = { inherit spkgs; inherit rsid3; };
      modules = [
        ./hosts/nixbox/configuration.nix
        inputs.home-manager.nixosModules.home-manager
        inputs.nix-index-database.nixosModules.nix-index
      ];
    };

    nixosConfigurations.vps = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = { inherit spkgs; };
      modules = [
        ./hosts/vps/configuration.nix
        inputs.home-manager.nixosModules.home-manager
      ];
    };
  };
}
