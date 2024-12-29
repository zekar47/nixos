{
  description = "something";
  inputs = {
    # nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable"; ## This fails
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; ## This fails as well
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
  };
  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.NixBox = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = inputs;
      modules = [ ./main/configuration.nix ];
    };
  };
}

