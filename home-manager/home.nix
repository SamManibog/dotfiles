# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
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

	packages = [ pkgs.neofetch ];

	file.hyprland_config = {
		target = ".config/hypr/hyprland.conf";
		source = "../dotfiles/hyprland.conf";
		recursive = true;
		force = true;
	};
	file.waybar_config = {
		target = ".config/waybar/config";
		source = "../dotfiles/waybar.conf";
		recursive = true;
		force = true;
	};
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.kitty = {
	  enable = true;
	  settings = {
		  confirm_os_window_close = 0;
		  enable_audio_bell = "no";
		  scrollback_lines = 5000;
	  };
  };

  programs.git = {
	  enable = true;
	  userName = "Sam Manibog";
	  userEmail = "sfmanibog@outlook.com";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
