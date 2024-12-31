{
  description = "something";
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
  };
  outputs = { self, nixpkgs, home-manager, nixvim, ... }@inputs: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
	allowUnfree = true;
      };
    };
  in
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs system; };
      modules = [ 
        ./main/configuration.nix
	home-manager.nixosModules.home-manager {
	  home-manager.extraSpecialArgs = {
	    inherit inputs;
	    inherit system;
	  };
	  home-manager.useGlobalPkgs = true;
	  home-manager.users."zekar" = import ./home-manager/home.nix;
	}
      ];
    };
  };
}
