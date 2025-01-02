{
  description = "ZEKAR's NixOS Flake.";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; 
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
  };
  outputs = { self, nixpkgs, home-manager, nixvim, nix-colors, ... }@inputs: 
    let
      system = "x86_64-linux";
    in
      {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs system; };
          modules = [ 
            ./main/configuration.nix
      	    ./main/hosts/vm-1.nix
            home-manager.nixosModules.home-manager {
              home-manager.extraSpecialArgs = {
                inherit inputs;
                inherit system;
                inherit nix-colors;
                hostName = "nixos";
              };
              home-manager.useGlobalPkgs = true;
              home-manager.users."zekar" = import ./home-manager/home.nix;
            }
          ];
        };
        nixosConfigurations.lap = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs system; };
          modules = [ 
            ./main/configuration.nix
      	    ./main/hosts/lap.nix
            home-manager.nixosModules.home-manager {
              home-manager.extraSpecialArgs = {
                inherit inputs;
                inherit system;
                inherit nix-colors;
                hostName = "lap";
              };
              home-manager.useGlobalPkgs = true;
              home-manager.users."zekar" = import ./home-manager/home.nix;
            }
          ];
      	};
      };
}
