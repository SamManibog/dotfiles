{
    description = "A nixos config with hyprland";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
        stylix.url = "github:nix-community/stylix";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager, stylix, ... } @ inputs:
        let
            inherit (self) outputs;
        in
            {
            nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = {inherit inputs;};
                modules = [
                    stylix.nixosModules.stylix
                    ./system/configuration.nix
                    inputs.home-manager.nixosModules.default
                ];
            };

            homeConfigurations = {
                "sam@nixos" = home-manager.lib.homeManagerConfiguration {
                    pkgs = nixpkgs.legacyPackages.x86_64-linux;
                    extraSpecialArgs = {inherit inputs outputs;};
                    modules = [
                        stylix.homeModules.stylix
                        ./home-manager/home.nix
                    ];
                };
            };
        };
}
