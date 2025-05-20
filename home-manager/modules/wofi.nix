{ ... }:
{
    programs.wofi = {
        enable = true;
        settings = {
            term = "kitty";
            prompt = "Search...";
        };
    };
}
