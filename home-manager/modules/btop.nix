{ pkgs, ... }:
{
    programs.btop = {
        enable = true;
        settings = {
            theme_background = true;

            truecolor = true;

            force_tty = false;

            presets = "cpu:0:default,proc:0:default mem:0:default,proc:0:default";

            vim_keys = false;

            rounded_corners = true;

            graph_symbol = "braille";

            graph_symbol_cpu = "default";

            graph_symbol_mem = "default";

            graph_symbol_net = "default";

            graph_symbol_proc = "default";

            shown_boxes = "proc cpu mem net";

            update_ms = 1500;

            proc_sorting = "cpu lazy";

            proc_reversed = false;

            proc_tree = true;

            proc_colors = true;

            proc_gradient = false;

            proc_per_core = true;

            proc_mem_bytes = true;

            proc_info_smaps = false;

            proc_left = false;

            cpu_graph_upper = "total";

            cpu_graph_lower = "total";

            cpu_invert_lower = true;

            cpu_single_graph = false;

            cpu_bottom = false;

            show_uptime = true;

            check_temp = true;

            cpu_sensor = "Auto";

            show_coretemp = true;

            cpu_core_map = "";

            temp_scale = "celsius";

            base_10_sizes = false;

            show_cpu_freq = true;

            clock_format = "%H:%M";

            background_update = true;

            custom_cpu_name = "";

            disks_filter = "exclude=/boot";

            mem_graphs = true;

            mem_below_net = false;

            zfs_arc_cached = true;

            show_swap = true;

            swap_disk = true;

            show_disks = true;

            only_physical = true;

            use_fstab = false;

            disk_free_priv = false;

            show_io_stat = true;

            io_mode = false;

            io_graph_combined = false;

            io_graph_speeds = "";

            net_download = 100;

            net_upload = 100;

            net_auto = true;

            net_sync = false;

            net_iface = "br0";

            show_battery = true;

            selected_battery = "Auto";

            log_level = "DEBUG";
        };
    };
}
