{
  description = "NixFiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = inputs@{ nixpkgs, home-manager, hyprland, ... }: {
    nixosConfigurations.avi = nixpkgs.lib.nixosSystem {
     system = "x86.64-linux";
     modules = [ 
        ./configuration.nix 
        ./system/fonts.nix
        hyprland.nixosModules.default {
          programs.hyprland.enable = true;
        }

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = {inherit inputs;};
          home-manager.users.avi = import ./home.nix;
        }
      ];
    };
  };
}
