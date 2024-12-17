{
  description = "My first flake :3";
  
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = inputs @ { self, nixpkgs, home-manager, ... }:
    {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [ 
        ./configuration.nix
        ./fruitninjaking/hyprland.nix
        home-manager.nixosModules.home-manager{
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.wesleyt = import ./fruitninjaking/home.nix;
        }
      ];
    };
  };
}
