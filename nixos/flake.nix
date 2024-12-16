{
  description = "My first flake :3";
  
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
  };
  
  outputs = { self, nixpkgs, ... }:
    let
      lib = nixpkgs.lib;
    in {
    nixosConfigurations = {
      MAIN = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./configuration.nix ];
      };
    };
  };
}
