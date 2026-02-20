{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rsid3 = {
      url = "github:randoragon/rsid3";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    secrets = {
      url = "github:randoragon/secrets";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lxmake = {
      url = "github:randoragon/lxmake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    note = {
      url = "github:randoragon/note";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    music-tools = {
      url = "github:randoragon/music-tools";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, ... }@inputs: let
    system = "x86_64-linux";
    spkgs = inputs.nixpkgs-stable.legacyPackages.${system};
    rsid3 = inputs.rsid3.packages.${system}.default;
    secrets = inputs.secrets.packages.${system}.default;
    lxmake = inputs.lxmake.packages.${system}.default;
    note = inputs.note.packages.${system}.default;
    music-tools = inputs.music-tools.packages.${system}.default;
    inherited-inputs = {
      inherit spkgs;
      inherit rsid3;
      inherit secrets;
      inherit lxmake;
      inherit note;
      inherit music-tools;
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

    nixosConfigurations.work = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = inherited-inputs;
      modules = [
        ./hosts/work/configuration.nix
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
