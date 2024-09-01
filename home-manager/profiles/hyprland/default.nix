{ config, pkgs, ... }: {
  programs = {
    bash = {
      initExtra = ''
        if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
           exec  Hyprland
        fi
      '';
    };
    fish = {
      loginShellInit = ''
        set TTY1 (tty)
        [ "$TTY1" = "/dev/tty1" ] && exec Hyprland
      '';
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    settings = [
      "monitor" = "HDMI-A-1, 1920x1080, 0x0, 1";
      "monitor" = "eDP-1, 1920x1080, 1920x0, 1";

      "$mod" = "SUPER";

      "$magenta"    = "rgb(${config.colorScheme.palette.magenta})";
      "$magenta_b"  = "rgb(${config.colorScheme.palette.magenta_b})";
      "$red"        = "rgb(${config.colorScheme.palette.red})";
      "$red_b"      = "rgb(${config.colorScheme.palette.red_b})";
      "$orange"     = "rgb(${config.colorScheme.palette.orange})";
      "$orange_b"   = "rgb(${config.colorScheme.palette.orange_b})";
      "$yellow"     = "rgb(${config.colorScheme.palette.yellow})";
      "$yellow_b"   = "rgb(${config.colorScheme.palette.yellow_b})";
      "$green"      = "rgb(${config.colorScheme.palette.green})";
      "$green_b"    = "rgb(${config.colorScheme.palette.green_b})";
      "$blue"       = "rgb(${config.colorScheme.palette.blue})";
      "$blue_b"     = "rgb(${config.colorScheme.palette.blue_b})";
      "$indigo"     = "rgb(${config.colorScheme.palette.indigo})";
      "$indigo_b"   = "rgb(${config.colorScheme.palette.indigo_b})";
      "$violet"     = "rgb(${config.colorScheme.palette.violet})";
      "$violet_b"   = "rgb(${config.colorScheme.palette.violet_b})";
      "$text"       = "rgb(${config.colorScheme.palette.text})";
      "$subtext01"  = "rgb(${config.colorScheme.palette.subtext01})";
      "$subtext00"  = "rgb(${config.colorScheme.palette.subtext00})";
      "$overlay02"  = "rgb(${config.colorScheme.palette.overlay02})";
      "$overlay01"  = "rgb(${config.colorScheme.palette.overlay01})";
      "$overlay00"  = "rgb(${config.colorScheme.palette.overlay00})";
      "$surface02"  = "rgb(${config.colorScheme.palette.surface02})";
      "$surface01"  = "rgb(${config.colorScheme.palette.surface01})";
      "$surface00"  = "rgb(${config.colorScheme.palette.surface00})";
      "$base"       = "rgb(${config.colorScheme.palette.base})";
      "$mantle"     = "rgb(${config.colorScheme.palette.mantle})";
      "$crust"      = "rgb(${config.colorScheme.palette.crust})";

      general = {
        "border_size" = "1";
        "no_border_on_floating" = "false";
        "gaps_in" = "4";
        "gaps_out" = "6";
        "gaps_workspaces" = "0";
        "col.inactive_border" = "$base04";
        "col.active_border" = "$base0C $base1C";
        "col.nogroup_border" = "$base04";
        "col.nogroup_border_active" = "$base04";
        "layout" = "dwindle";
        "no_focus_fallback" = "false";
        "apply_sens_to_raw" = "false";
        "resize_on_border" = "true";
        "extend_border_grab_area" = "10";
        "hover_icon_on_border" = "true";
        "allow_tearing" = "true";
        "resize_corder" = "0";
      };
      
      decoration = {
        "rounding" = "4";

        "active_opacity" = "1.0";
        "inactive_opacity" = "1.0";
        "fullscreen_opacity" = "1.0";

        "drop_shadow" = "true";
        "shadow_range" = "4";
        "shadow_render_power" = "3";
        "shadow_ignore_window" = "true";
        "col.shadow" = "$base";
        "col.shadow_inactive" = "$mantle";
        "shadow_offset" = "[0, 0]";
        "shadow_scale" = "1.0";

        "dim_inactive" = "false";
        "dim_strength" = "0.5";
        "dim_special" = "0.2";
        "dim_around" = "0.4";

        blur = {
          "enabled" = "true";
          "size" = "8";
          "passes" = "1";
          "ignore_opacity" = "false";
          "new_optimizations" = "true";
          "xray" = "false";
          "noise" = "0.0117";
          "contrast" = "0.8916";
          "brightness" = "0.8172";
          "vibrancy" = "0.1696";
          "vibrancy_darkness" = "0.0";
          "special" = "false";
          "popups" = "false";
          "popups_ignorealpha" = "0.2";
        };
      };

      animations = {
        "enabled" = "true";
        "bezier" = "overshot, 0.13, 0.99, 0.29, 1.1";
        "animation" = "windows, 1, 4, default";
        "animation" = "windowsOut, 1, 5, default";
        "animation" = "border, 1, 5, default";
        "animation" = "fade, 1, 8, default";
        "animation" = "workspaces, 1, 6, default";
      };

      input = {
        "kb_model" = "";
        "kb_layout" = "us";
        "kb_variant" = "";
        "kb_options" = "caps:escape";
        "kb_rules" = "";
        "kb_file" = "";
        "numlock_by_default" = "true";
        "resolve_binds_by_sym" = "false";
        "repeat_rate" = "25";
        "repeat_delay" = "500";
        "sensitivity" = "0";

        "accel_profile" = "";
        "force_no_accel" = "false";
        "left_handed" = "false";
        "scroll_points" = "";
        "scroll_method" = "";
        "scroll_button" = "0";
        "scroll_button_lock" = "0";
        "scroll_factor" = "1.0";
        "natural_scroll" = "yes";
        "follow_mouse" = "2";
        "focus_on_close" = "0";
        "mouse_refocus" = "true";
        "float_switch_override_focus" = "2";
        "special_fallthrough" = "false";
        "off_window_axis_event" = "1";
        "emulate_discrete_scroll" = "1";

        touchpad = {
          "disable_while_typing" = "true";
          "natural_scroll" = "false";
          "scroll_factor" = "1.0";
          "middle_button_emulation" = "false";
          "tap_button_map" = "";
          "clickfinger_behavior" = "false";
          "tap_to_click" = "true";
          "drag_lock" = "false";
          "tap-and-drag" = "false";
        };

        touchdevice = {
          "transform" = "0";
          "output" = "";
          "enabled" = "true";
        };

        tablet = {
          "transform" = "0";
          "output" = "";
          "region_position" = "[0, 0]";
          "region_size" = "[0, 0]";
          "relative_inpyt" = "false";
          "left_handed" = "false";
          "active_area_size" = "[0, 0]";
          "active_area_position" = "[0, 0]";
        };
      };

      gestures = {
        "workspace_swipe" = "false";
        "workspace_swipe_fingers" = "3";
        "workspace_swipe_min_fingers" = "false";
        "workspace_swipe_distance" = "300";
        "workspace_swipe_touch" = "false";
        "workspace_swipe_invert" = "true";
        "workspace_swipe_touch_invert" = "false";
        "workspace_swipe_min_speed_to_force" = "30";
        "workspace_swipe_cancel_ratio" = "0.5";
        "workspace_swipe_create_new" = "true";
        "workspace_swipe_direction_lock" = "true";
        "workspace_swipe_direction_lock_threshold" = "10";
        "workspace_swipe_forever" = "false";
        "workspace_swipe_use_r" = "false";
      };

      group = {
        "insert_after_current" = "true";
        "focus_removed_window" = "true";
        "col.border_active" = "$yellow";
        "col.border_inactive" = "$yellow";
        "col.border_locked_active" = "$yellow";
        "col.border_locked_inactive" = "$yellow";

        groupbar = {
          "enabled" = "true";
          "font_family" = "";
          "font_size" = "8";
          "gradients" = "true";
          "height" = "14";
          "stacked" = "false";
          "priority" = "3";
          "render_titles" = "true";
          "scrolling" = "true";
          "text_color" = "$text";
          "col.active" = "$text";
          "col.inactive" = "$text";
          "col.locked_active" = "$text";
          "col.locked_inactive" = "$text";
        };
      };
      
      misc = {
        "disable_hyprland_logo" = "true";
        "disable_splash_rendering" = "true";
        "col.splash" = "$text";
        "font_family" = "Sans";
        "splash_font_family" = "";
        "force_default_wallpaper" = "-1";
        "vfr" = "true";
        "vrr" = "0";
        "mouse_move_enables_dpms" = "false";
        "key_press_enables_dpms" = "false";
        "always_follow_on_dnd" = "true";
        "layers_hog_keyboard_focus" = "true";
        "animate_manual_resizes" = "false";
        "animate_mouse_windowdragging" = "false";
        "disable_autoreload" = "true";
        "enable_swallow" = "true";
        "swallow_regex" = "";
        "swallow_exception_regex" = "";
        "focus_on_activate" = "true";
        "mouse_move_focuses_monitor" = "true";
        "render_ahead_of_time" = "false";
        "render_ahead_safezone" = "1";
        "allow_session_lock_restore" = "false";
        "background_color" = "$crust";
        "close_special_on_empty" = "true";
        "new_window_takes_over_fullscreen" = "0";
        "exit_window_retains_fullscreen" = "false";
        "initial_workspace_tracking" = "1";
        "middle_click_paste" = "true";
        "render_unfocused_fps" = "15";
      };

      binds = {
        "pass_mouse_when_bound" = "false";
        "scroll_event_delay" = "300";
        "workspace_back_and_forth" = "true";
        "allow_workspace_cycles" = "true";
        "workspace_center_on" = "1";
        "focus_preferred_method" = "0";
        "ignore_group_lock" = "false";
        "movefocus_cycles_fullscreen" = "true";
        "disable_keybind_grabbing" = "false";
        "window_direction_monitor_fallback" = "true";
      };

      xwayland = {
        "use_nearest_neighbor" = "true";
        "force_zero_scaling" = "false";
      };
      
      opengl = {
        "nvidia_anti_flicker" = "true";
        "force_introspection" = "2";
      };

      render = {
        "explicit_sync" = "2";
        "explicit_sync_kms" = "2";
        "direct_scanout" = "false";
      };

      cursor = {
        "sync_gsettings_theme" = "false";
        "no_hardware_cursors" = "false";
        "no_break_fs_vrr" = "false";
        "min_refresh_rate" = "24";
        "hotspot_padding" = "1";
        "inactive_timeout" = "0";
        "no_warps" = "false";
        "persistent_warps" = "false";
        "warp_on_change_workspace" = "false";
        "default_monitor" = "";
        "zoom_factor" = "1.0";
        "zoom_rigid" = "false";
        "enable_hyprcursor" = "false";
        "hide_on_key_press" = "false";
        "hide_on_touch" = "true";
        "allow_dumb_copy" = "false";
      };

      dwindle = {
        "pseudotile" = "true";
        "force_split" = "0";
        "preserve_split" = "false";
        "smart_split" = "false";
        "smart_resizing" = "true";
        "permanent_direction_override" = "false";
        "special_scale_factor" = "1";
        "split_width_multiplier" = "1.0";
        "no_gaps_when_only" = "0";
        "use_active_for_splits" = "true";
        "default_split_ratio" = "1.0";
      };

      master = {
        "allow_small_split" = "false";
        "special_scale_factor" = "1.0";
        "mfact" = "0.55";
        "new_status" = "slave";
        "new_on_top" = "false";
        "new_on_active" = "none";
        "no_gaps_when_only" = "0";
        "orientation" = "left";
        "inherit_fullscreen" = "true";
        "always_center_master" = "false";
        "smart_resizing" = "true";
        "drop_at_cursor" = "true";
        "" = "";
      };
    ];

    # Commands after initialization
    extraCommands = [
      ""
    ];
    extraConfig = ''

    '';
  };
}
