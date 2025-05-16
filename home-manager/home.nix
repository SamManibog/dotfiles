# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs, lib, config, pkgs, ... }:

{
    # You can import other home-manager modules here
    imports = [
        ./modules/waybar.nix
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
            connman-gtk
            wofi
        ];

        file = {
            hyprland_config = {
                target = ".config/hypr/hyprland.conf";
                text = builtins.readFile ../configs/hyprland.conf;
                recursive = true;
                force = true;
            };

            bash_rc = {
                target = "./.bashrc";
                text = builtins.readFile ../configs/bashrc.sh;
                recursive = true;
                force = true;
            };
        };
    };

    programs = {
        kitty = {
            enable = true;
            settings = {
                confirm_os_window_close = 0;
                enable_audio_bell = "no";
                scrollback_lines = 5000;
            };
        };

        git = {
            enable = true;
            userName = "Sam Manibog";
            userEmail = "sfmanibog@outlook.com";
        };
    };

    services = {
        ssh-agent.enable = true;
    };

    # Nicely reload system units when changing configs
    systemd.user.startServices = "sd-switch";

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    home.stateVersion = "24.11";
}
