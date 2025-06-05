{ ... }:
{
    programs.tofi = {
        enable = true;
        settings = {
            terminal = "kitty --hold";
            drun-launch = false;

            hide-cursor = true;
            text-cursor = true;

            prompt-text = "";
            placeholder-text = "Run Program...";

            outline-width = 0;
            border-width = 2;

            width = "70%";
            height = "70%";
        };
    };
}
