{ ... }:
{
    programs.wofi = {
        enable = true;
        settings = {
            term = "kitty";
            prompt = "Search...";
            insensitive = true;
            normal_window = true;
            hide_scroll = true;
            allow_images = true;
        };
    };
}
