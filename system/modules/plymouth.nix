{ ... }:
{
    boot = {
        plymouth.enable = true;
        # Enable "Silent boot"
        consoleLogLevel = 0;
        initrd.verbose = false;
        initrd.systemd.enable = true;
        kernelParams = [
            "quiet"
            "rd.systemd.show_status=no"
            "boot.shell_on_fail"
            "udev.log_priority=3"
        ];
    };

    stylix.targets.plymouth.enable = false;
}
