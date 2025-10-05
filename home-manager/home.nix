# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs, lib, config, pkgs, ... }:

{
    # You can import other home-manager modules here
    imports = [
        ./modules/waybar.nix
        ./modules/hyprland.nix
        ./modules/bash.nix
        ./modules/tofi.nix
        ./modules/kitty.nix
        ./modules/yazi.nix
        ./modules/wlogout.nix
        ./modules/btop.nix
        # ./modules/thunderbird.nix

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
            pwvucontrol
            wl-clipboard
            gimp3-with-plugins
            krita
        ];

        sessionVariables = {
            EDITOR = "nvim";
            BROWSER = "firefox";
            ProjectLocations = "/home/sam/Projects";
        };

        activation = {
            init = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
            mkdir ~/Projects
            '';
        };
    };

    dconf.settings = {
        "org/gnome/desktop/peripherals/touchpad" = { natural-scroll = true; };
    };

    xdg = {
        enable = true;
        userDirs = {
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
