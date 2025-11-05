{
  description = "My dotfiles";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
#      inputs.nixpkgs.follows = "nixpkgs";
    };
    
  };

  outputs = {self, nixpkgs, nixpkgs-unstable, home-manager, caelestia-shell, ... }: 
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      

      # Stable packages
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      # Unstable packages
      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in { 
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        specialArgs = { inherit unstable;  };
        modules = [ 
          ./configuration.nix 
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.jafed = {
              imports = [ 
                ./home.nix
                caelestia-shell.homeManagerModules.default
              ];
            };
           }
         ];
      };
    };
  };
}
