{
  description = "FLAKE FLAKE FLAKE FLAKE";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland?submodules=1&ref=v0.48.1";
    swww.url = "github:LGFae/swww";
  };

  outputs = { self, nixpkgs , ... } @ inputs: {
	nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
		specialArgs = { inherit inputs; };
		modules = [ ./configuration.nix ];
		}; 

    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

  };
}
