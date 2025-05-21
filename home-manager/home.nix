# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs, lib, config, pkgs, ... }:

{
    # You can import other home-manager modules here
    imports = [
        ./modules/waybar.nix
        ./modules/hyprland.nix
        ./modules/bash.nix
        ./modules/wofi.nix
        ./modules/kitty.nix

        ../themes/stylix.nix
    ];

    nixpkgs = {
        overlays = [
        ];

        # Configure your nixpkgs instance
        config = {
            # Disable if you don't want unfree packages
            allowUnfree = true;
            # Workaround for https://github.com/nix-community/home-manager/issues/2942
            allowUnfreePredicate = _: true;
        };
    };

    home = {
        username = "sam";
        homeDirectory = "/home/sam";

        packages = with pkgs; [
            neofetch
            btop
            pwvucontrol
            gimp3-with-plugins
        ];
    };

    programs.git = {
        enable = true;
        userName = "Sam Manibog";
        userEmail = "sfmanibog@outlook.com";
    };

    services = {
        ssh-agent.enable = true;
        blueman-applet.enable = true;
    };

    # Nicely reload system units when changing configs
    systemd.user.startServices = "sd-switch";

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    home.stateVersion = "24.11";
}
