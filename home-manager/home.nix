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

        sessionVariables = {
            EDITOR = "nvim";
            BROWSER = "firefox";
            ProjectLocations = "~/Projects";
        };

        activation = {
            init = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
            mkdir ~/Projects
            '';
        };
    };

    xdg.enable = true;
    xdg.userDirs = {
        enable = true;
        createDirectories = true;
        music = "${config.home.homeDirectory}/Music";
        videos = "${config.home.homeDirectory}/Videos";
        pictures = "${config.home.homeDirectory}/Pictures";
        templates = "${config.home.homeDirectory}/Templates";
        download = "${config.home.homeDirectory}/Downloads";
        documents = "${config.home.homeDirectory}/Documents";
        desktop = "${config.home.homeDirectory}/Desktop";
        publicShare = "${config.home.homeDirectory}/Desktop";
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
    home.stateVersion = "25.05";
}
