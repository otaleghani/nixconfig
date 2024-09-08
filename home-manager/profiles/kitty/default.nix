# https://mynixos.com/home-manager/options/programs.kitty
{ config, pkgs, ... }: {
  programs.kitty.enable = true;
  programs.kitty.settings = {
    font_family = "JetBrainsMono Nerd Font";
    font_size = "12";
    foreground = "#${config.colorScheme.palette.text}";
    background = "#${config.colorScheme.palette.base}";
    shell = "fish";
  };
  
  programs.kitty.extraConfig = ''
    background_opacity 0.7

    selection_foreground #${config.colorScheme.palette.base}
    selection_background #${config.colorScheme.palette.subtext01}

    cursor #${config.colorScheme.palette.subtext01}
    cursor_text_color #${config.colorScheme.palette.base}

    url_color #${config.colorScheme.palette.subtext01}

    active_border_color #${config.colorScheme.palette.subtext00}
    inactive_border_color #${config.colorScheme.palette.text}
    bell_border_color #${config.colorScheme.palette.yellow}

    wayland_titlebar_color #${config.colorScheme.palette.base}

    active_tab_foreground #${config.colorScheme.palette.surface02}
    active_tab_background #${config.colorScheme.palette.violet}
    inactive_tab_foreground #${config.colorScheme.palette.text}
    inactive_tab_background #${config.colorScheme.palette.mantle}
    tab_bar_background #${config.colorScheme.palette.surface02}

    mark1_foreground #${config.colorScheme.palette.base}
    mark2_foreground #${config.colorScheme.palette.base}
    mark3_foreground #${config.colorScheme.palette.base}
    mark1_background #${config.colorScheme.palette.subtext00}
    mark2_background #${config.colorScheme.palette.violet}
    mark2_background #${config.colorScheme.palette.magenta}

    color0	#${config.colorScheme.palette.surface01}
    color8 	#${config.colorScheme.palette.surface02}

    color1	#${config.colorScheme.palette.red}
    color9 	#${config.colorScheme.palette.red_b}

    color2 	#${config.colorScheme.palette.green}
    color10 	#${config.colorScheme.palette.green_b}

    color3 	#${config.colorScheme.palette.yellow}
    color11 	#${config.colorScheme.palette.yellow_b}

    color4 	#${config.colorScheme.palette.blue}
    color12 	#${config.colorScheme.palette.blue_b}

    color5 	#${config.colorScheme.palette.magenta}
    color13 	#${config.colorScheme.palette.magenta}

    color6 	#${config.colorScheme.palette.indigo}
    color14 	#${config.colorScheme.palette.indigo}

    color7 	#${config.colorScheme.palette.text}
    color15 	#${config.colorScheme.palette.subtext01}

    window_padding_width 2 1 
  '';
}
