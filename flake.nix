{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    rsid3.url = "github:randoragon/rsid3";
    secrets.url = "github:randoragon/secrets";
    lxmake.url = "github:randoragon/lxmake";
    note.url = "github:randoragon/note";

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
    secrets = inputs.secrets.packages.${system}.default;
    lxmake = inputs.lxmake.packages.${system}.default;
    note = inputs.note.packages.${system}.default;
    inherited-inputs = {
      inherit spkgs;
      inherit rsid3;
      inherit secrets;
      inherit lxmake;
      inherit note;
    };
  in {
    nixosConfigurations.default = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = inherited-inputs;
      modules = [
        ./hosts/default/configuration.nix
        inputs.home-manager.nixosModules.home-manager
        inputs.nix-index-database.nixosModules.nix-index
      ];
    };

    nixosConfigurations.nixbox = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = inherited-inputs;
      modules = [
        ./hosts/nixbox/configuration.nix
        inputs.home-manager.nixosModules.home-manager
        inputs.nix-index-database.nixosModules.nix-index
      ];
    };

    nixosConfigurations.vps = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = inherited-inputs;
      modules = [
        ./hosts/vps/configuration.nix
        inputs.home-manager.nixosModules.home-manager
      ];
    };
  };
}
