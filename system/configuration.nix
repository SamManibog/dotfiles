# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:
{
    imports =
        [
            #./modules/hyprland.nix
            ./modules/awesome.nix

            ./modules/sddm.nix
            #./modules/regreet.nix

            ./modules/bluetooth.nix
            ./modules/dbus.nix
            ./modules/pipewire.nix
            ./modules/fonts.nix
            ./modules/networking.nix
            ./modules/automount.nix
            ./modules/plymouth.nix
            ./modules/upower.nix
            ./modules/kitty.nix

            ../themes/stylix.nix

            ./hardware-configuration.nix
        ];

    # Bootloader
    boot = {
        loader = {
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
        };

        # Note: open the bootloader list by pressing any key.
        loader.timeout = 0;
    };

    # Set your time zone.
    time.timeZone = null;

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
    };

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.sam = {
        isNormalUser = true;
        description = "Sam Manibog";
        extraGroups = [ "networkmanager" "wheel" ];
    };

    # Nix-ld to allow use of dynamically linked libraries
    programs.nix-ld = {
        enable = true;
        # libraries = [];
    };

    # Web Browser (firefox)
    programs.firefox.enable = true;

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
        home-manager

        # mount MTP devices
        # usage: jmtpfs [mount point] <- mounts device
        #        fusermount -u [mount point] <- unmounts device
        jmtpfs

        #DE
        neovim
        networkmanagerapplet
        nautilus
        brightnessctl

        #utils
        p7zip
        unzip

        # Development
        cmake
        libgcc
        ninja
        rustup
        lua
        python314

        wget
    ];
    environment.variables = {
        EDITOR = "nvim";
        BROWSER = "firefox";
    };

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

    # List services that you want to enable:
    # Enable the OpenSSH daemon.
    services.openssh.enable = true;

    security.pam.services.login.enableGnomeKeyring = true;
    services.gnome.gnome-keyring.enable = true;

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "25.05"; # Did you read the comment?

}
