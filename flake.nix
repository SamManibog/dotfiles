{
	description = "A nixos config with hyprland";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = { self, nixpkgs, home-manager, ... } @ inputs:
	let
		inherit (self) outputs;
	in
	{
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			specialArgs = {inherit inputs;};
			modules = [
				./configuration.nix
			];
		};


		homeConfigurations = {
			"sam@nixos" = home-manager.lib.homeManagerConfiguration {
				pkgs = nixpkgs.legacyPackages.x86_64-linux;
				extraSpecialArgs = {inherit inputs outputs;};
				modules = [./home-manager/home.nix];
			};
		};
	};
}
