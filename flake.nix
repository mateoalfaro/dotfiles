{
  description = "A Nix flake for my machine";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager }:@inputs {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./imports.nix
          home-manager.nixosModules.homeManager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPkgs = true;
              users.jafed = import ./home.nix;
            };
          }
        ];
      };
    };
  };
}
