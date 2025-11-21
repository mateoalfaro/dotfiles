# dotfiles
A NixOS template for a flakes + home-manager based config

## structure
> /etc/nixos/
> ├── configuration.nix          # Main entry point
> ├── imports.nix                # Hub for all imports
> ├── hardware-configuration.nix # (Keep your existing file)
> ├── desktop.nix                # (Your existing file)
> ├── gaming.nix                 # (Your existing file)
> └── modules/                   # New folder
>    ├── boot.nix
>    ├── hardware.nix
>    ├── networking.nix
>    ├── system.nix
>    └── users.nix
