{ lib, pkgs, ... }:

{
    programs.kitty = {
        enable = true;
        font = {
            name = lib.mkForce "CommitMono Nerd Font Mono";
            package = lib.mkForce pkgs.nerd-fonts.commit-mono;
        };
        settings = {
            confirm_os_window_close = 0;
            enable_audio_bell = "no";
            scrollback_lines = 5000;

            cursor_shape = "block";
            cursor_shape_unfocused = "block";
            cursor_stop_blinking_after = 0;
        };
        shellIntegration.mode = "no-cursor";
    };

    home.sessionVariables.TERMINAL = lib.mkForce "kitty";
    home.sessionVariables.TERM = lib.mkForce "kitty";

    #override desktop entry to always hold kitty open
    xdg.desktopEntries.kitty.settings = {
        Version = "1.0";
        Type = "Application";
        Name = "kitty";
        GenericName = "Terminal emulator";
        Comment = "Fast, feature-rich, GPU based terminal";
        TryExec = "kitty";
        StartupNotify = "true";
        Exec = "kitty";
        Icon = "kitty";
        Categories = "System;TerminalEmulator;";
        X-TerminalArgExec = "--hold";
        X-TerminalArgTitle = "--title";
        X-TerminalArgAppId = "--class";
        X-TerminalArgDir = "--working-directory";
        X-TerminalArgHold = "--hold";
    };
}
