{ pkgs, ... }:

{
    home.packages = with pkgs; [
        ffmpeg
        p7zip
        jq
        poppler
        fd
        ripgrep
        fzf
        resvg
        imagemagick
    ];

    programs.yazi = {
        enable = true;

        enableBashIntegration = true;
        shellWrapperName = "y";

        settings.mgr.show_hidden = true;
        plugins = {
			mount = pkgs.yaziPlugins.mount;
            chmod = pkgs.yaziPlugins.chmod;
		};

        keymap = {
            mgr.prepend_keymap = [
                # Quitting
                { on = "<Esc>"; run = "quit"; desc = "Quit the Program"; }
                { on = "<C-q>"; run = "quit --no-cwd-file"; desc = "Quit without cwd File"; }
                { on = "q"; run = "close"; desc = "Quit the Program"; }
                { on = "Q"; run = "close --no-cwd-file"; desc = "Quit without cwd File"; }
                { on = "<C-c>"; run = "escape"; desc = "Escape the Current Menu"; }

                # Faster Goto
                { on = [ "e" ]; run = "cd --interactive"; desc = "Jump interactively"; }

                # Selection
                { on = "<Space>"; run = "toggle"; desc = "Toggle current"; }

                # Tab Navigation
                { on = "H"; run = "tab_switch -1 --relative"; desc = "Previous Tab"; }
                { on = "L"; run = "tab_switch 1 --relative"; desc = "Next Tab"; }
                { on = "<C-h>"; run = "tab_swap -1"; desc = "Swap with Previous Tab"; }
                { on = "<C-l>"; run = "tab_swap 1"; desc = "Swap with Next Tab"; }

                # Plugins
                { on = "M"; run = "plugin mount"; desc = "Open Mount Menu"; }
                { on = [ "c" "m" ]; run = "plugin chmod"; desc = "Change Modifiers"; }
            ];
        };
    };
}
