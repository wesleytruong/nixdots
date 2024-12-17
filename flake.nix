{
  description = "My first flake :3";
  
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };
  
  outputs = inputs @ { self, nixpkgs, home-manager, ... }:
    {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      system = "x86_64-linux";
      modules = [ 
        ./configuration.nix
        home-manager.nixosModules.home-manager{
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.wesleyt = import ./fruitninjaking/home.nix;
        }
      ];
    };
  };
}
