{
  description = "My first flake :3";
  
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
  };
  
  outputs = inputs @ { self, nixpkgs, ... }:
    {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [ 
        ./configuration.nix
        ./fruitninjaking/configuration.nix
        ./fruitninjaking/hyprland.nix
      ];
    };
  };
}
