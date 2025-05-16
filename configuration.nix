# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:
{
    imports =
        [ # Include the results of the hardware scan.
            ./hardware-configuration.nix
        ];

    # Bootloader
    boot = {
        loader = {
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
        };

        plymouth.enable = true;

        # Enable "Silent boot"
        consoleLogLevel = 3;
        initrd.verbose = false;
        kernelParams = [
            "quiet"
            "splash"
            "boot.shell_on_fail"
            "udev.log_priority=3"
            "rd.systemd.show_status=auto"
        ];

        # Note: open the bootloader list by pressing any key.
        loader.timeout = 0;
    };

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";

    # Enable networking
    networking.hostName = "nixos"; # Define your hostname.
    networking.wireless.iwd = {
        enable = true;
        settings = {
            Network.EnableIPv6 = true;
            Settings.AutoConnect = true;
        };
    };
    services.connman = {
        enable = true;
        wifi.backend = "iwd";
    };
    /*
    programs.nm-applet.enable = true;
    networking.networkmanager.enable = true;
    */
    networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

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

    # Enable sddm
    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
    };

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        # If you want to use JACK applications, uncomment this
        #jack.enable = true;

        # use the example session manager (no others are packaged yet so this is enabled by default,
        # no need to redefine it in your config for now)
        #media-session.enable = true;
    };

    # Enable bluetooth
    hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
    };

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.sam = {
        isNormalUser = true;
        description = "Sam Manibog";
        extraGroups = [ "networkmanager" "wheel" ];
    };

    # Login Manager (SDDM)
    programs.uwsm.enable = true;
    programs.hyprland = {
        enable = true;
        withUWSM = true;
    };
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    # Web Browser (firefox)
    programs.firefox.enable = true;

    # File Explorer (Nautilus)
    programs.nautilus-open-any-terminal = {
        enable = true;
        terminal = "kitty";
    };

    # Text Editor (Neovim)
    programs.neovim = {
        enable = true;
        defaultEditor = true;
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
        home-manager
        #DE
        xarchiver
        networkmanagerapplet
        nautilus
        nwg-look
        brightnessctl
        kitty

        #utils
        unzip

        # c/c++ programming
        gcc
        ninja

        # wget
    ];

    fonts.packages = with pkgs; [
        nerd-fonts.commit-mono
        roboto
        paratype-pt-serif
    ];
    fonts.fontconfig.defaultFonts = {
        monospace = [ "CommitMono Nerd Font Mono" ];
        sansSerif = [ "Roboto" "CommitMono NerdFont" ];
        serif = [ "Pt-Serif" "CommitMono NerdFont" ];
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
    system.stateVersion = "24.11"; # Did you read the comment?

}
