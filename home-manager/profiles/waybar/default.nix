# https://mynixos.com/home-manager/options/programs.waybar
{ config, pkgs, ... }: {
  programs.waybar = {
    enable = true;
    systemd = {
      enable = false;
      target = "graphical-session.target";
    };

    settings = [];

    settings = [{
      "margin-top" = 4;
      "margin-right" = 4;
      "margin-left" = 4;
      "layer" = "top";
      "position" = "top";

      # Modules
      modules-left = [
        "custom/launcher"
        "hyprland/workspaces"
        "group/hardware"
        "custom/spotify"
      ];
      modules-center = [ "clock" ];
      modules-right = [
        "backlight"
        "bluetooth"
        "network"
        "pulseaudio"
        "battery"
        "custom/powermenu"
      ];

      "custom/spotify" = {
        "exec" = ''
          echo "$(cat ~/.cache/dump/current_song.json | jq -r '.item.name') - $(cat ~/.cache/dump/current_song.json | jq -r '.item.album.artists[0].name')"'';
        "signal" = 9;
        "on-click" = "spotify_player get key playback && pkill -RTMIN+9 waybar";
        "on-click-middle" =
          "hyprctl dispatch exec -- [workspace 9] kitty -e spotify_player";
        "max-lenght" = 30;
      };

      "group/hardware" = {
        "orientation" = "inherit";
        "drawer" = { "transition-duration" = "500"; };
        "modules" = [ "cpu" "memory" "temperature" "custom/hdd" ];
      };

      "custom/hdd" = {
        "format" = " {}";
        "exec" = "df -H | grep '/dev/nvme0n1p2' | awk '{print $(NF-1)}'";
        "tooltip-format" = "df -H";
        "on-click-middle" =
          "hyprctl dispatch exec -- [workspace 10] kitty -e btop";
      };

      "bluetooth" = {
        "format-off" = "󰂲 {num_connections}";
        "format-on" = "󰂯 {num_connections}";
        "format-connected" = "󰂱 {num_connections}";
        "on-click" =
          "pkill rofi || sleep 0.1 && ~/.config/scripts/bluetooth.sh";
        "max-lenght" = 40;
      };

      "custom/weather" = {
        "exec" =
          "~/.config/scripts/cron/ansiweather.sh -l Pontassieve,IT -a false -p false -w false -d false -h false -s true | awk -F\" - UVI:\" '{sub(/.*: /, \"\", $1); print $1}' | awk '{print substr($0, length($0), 1) \" \" substr($0, 1, length($0)-1)}'";
        "on-click" = ''notify-send "$(cat ~/.forecast/forecast)"'';
      };

      "custom/launcher" = {
        "format" = " ";
        "on-click" =
          "pkill rofi || sleep 0.1 && rofi -no-lazy-grab -show drun -modi drun";
        "tooltip" = false;
      };

      "hyprland/workspaces" = {
        "format" = "{icon}";
        "on-click" = "activate";
      };

      "backlight" = {
        "device" = "intel_backlight";
        "on-scroll-up" = "brightnessctl set +1%";
        "on-scroll-down" = "brightnessctl set 1%-";
        "format" = "{icon} {percent}%";
        "format-icons" = [ "󰃝" "󰃞" "󰃟" "󰃠" ];
      };

      "pulseaudio" = {
        "scroll-step" = 1;
        "format" = "{icon} {volume}%";
        "format-muted" = "󰖁 Muted";
        "format-icons" = { "default" = [ "" "" "" ]; };
        "on-click" = "pamixer -t";
        "tooltip" = false;
      };

      "battery" = {
        "interval" = 10;
        "states" = {
          "warning" = 20;
          "critical" = 10;
        };
        "format" = "{icon} {capacity}%";
        "format-icons" = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
        "format-full" = "{icon} {capacity}%";
        "format-charging" = "󰂄 {capacity}%";
        "tooltip" = false;
      };

      "clock" = {
        "interval" = 1;
        "format" = "{:%I:%M %p  %A %b %d}";
        "tooltip" = true;
        "tooltip-format" = "<tt>{calendar}</tt>";
      };

      "memory" = {
        "interval" = 1;
        "format" = "󰍛 {percentage}%";
        "states" = { "warning" = 85; };
        "on-click-middle" =
          "hyprctl dispatch exec -- [workspace 10] kitty -e btop";
      };

      "cpu" = {
        "interval" = 1;
        "format" = "󰻠 {usage}%";
        "on-click-middle" =
          "hyprctl dispatch exec -- [workspace 10] kitty -e btop";
      };

      "network" = {
        "format-disconnected" = "󰯡 Disconnected";
        "format-ethernet" = "󰀂 {ifname} ({ipaddr})";
        "format-linked" = "󰖪 {essid} (No IP)";
        "format-wifi" = "󰖩 {essid}";
        "interval" = 1;
        "on-click" = "pkill rofi || sleep 0.1 && ~/.config/scripts/wifi.sh";
        "max-lenght" = 40;
      };

      "temperature" = {
        "tooltip" = false;
        "format" = " {temperatureC}°C";
        "on-click-middle" =
          "hyprctl dispatch exec -- [workspace 10] kitty -e btop";
      };

      "custom/powermenu" = {
        "format" = "";
        "on-click" = "pkill rofi || sleep 0.1 && ~/.config/scripts/power.sh";
        "tooltip" = false;
      };
    }];

    style = ''
      @define-color base #${config.colorScheme.palette.base};
      @define-color mantle #${config.colorScheme.palette.mantle};
      @define-color surface00 #${config.colorScheme.palette.surface00};
      @define-color surface01 #${config.colorScheme.palette.surface01};
      @define-color surface02 #${config.colorScheme.palette.surface02};
      @define-color text #${config.colorScheme.palette.text};
      @define-color subtext01 #${config.colorScheme.palette.subtext01};
      @define-color subtext00 #${config.colorScheme.palette.subtext00};
      @define-color red #${config.colorScheme.palette.red};
      @define-color orange #${config.colorScheme.palette.orange};
      @define-color yellow #${config.colorScheme.palette.yellow};
      @define-color green #${config.colorScheme.palette.green};
      @define-color blue #${config.colorScheme.palette.blue};
      @define-color indigo #${config.colorScheme.palette.indigo};
      @define-color violet #${config.colorScheme.palette.violet};
      @define-color magenta #${config.colorScheme.palette.magenta};
      @define-color red_b #${config.colorScheme.palette.red_b};
      @define-color orange_b #${config.colorScheme.palette.orange_b};
      @define-color yellow_b #${config.colorScheme.palette.yellow_b};
      @define-color green_b #${config.colorScheme.palette.green_b};
      @define-color blue_b #${config.colorScheme.palette.blue_b};
      @define-color indigo #${config.colorScheme.palette.indigo};
      @define-color violet #${config.colorScheme.palette.violet};
      @define-color magenta #${config.colorScheme.palette.magenta};

      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 10pt;
        font-weight: bold;
        border-radius: 0px;
        transition-property: background-color;
        transition-duration: 0.5s;
      }
      @keyframes blink_red {
        to {
          background-color: @red;
          color: @surface00;
        }
      }
      .warning, .critical, .urgent {
        animation-name: blink_red;
        animation-duration: 1s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }
      window#waybar {
        background-color: alpha(@base,0.6);
      	padding: 4px;
      	border-radius: 8px;
            }
            window > box {
              padding: 4px;
            }
            #workspaces {
      	padding: 0px;
      	border-radius: 6px;
            }
            #workspaces button {
              padding: 2px;
      	margin-right: 4px; 
      	border-radius: 4px;
      	color: @text;
            }
            #workspaces button:last-child {
      	margin-right: 0px;
            }
            #workspaces button.active {
              background-color: @indigo;
              color: @mantle;
            }
            #workspaces button.urgent {
              color: @mantle;
            }
            #workspaces button:hover {
              background-color: @subtext01;
              color: @mantle;
            }
            tooltip {
              background: @surface00;
            }
            tooltip label {
              color: @subtext01;
            }
            #custom-launcher {
              font-size: 12px;
              padding-left: 8px;
              padding-right: 6px;
              color: @indigo;
            }
            #mode, #custom-spotify, #clock, #memory, #temperature,#cpu, #mpd, #custom-wall, #temperature, #backlight, #pulseaudio, #network, #battery, #custom-powermenu, #custom-cava-internal, #custom-hdd, #bluetooth {
              padding-left: 8px;
              padding-right: 8px;
            }
            #cpu {
              padding-left: 12px;
              color: @magenta;
            }
            #memory {
              color: @violet;
            }
            #temperature {
              color: @indigo;
            }
            #custom-hdd {
              color: @blue;
            }
            #clock {
              color: @text;
            }
            #pulseaudio {
              color: @orange;
            }
            #backlight {
              color: @yellow;
            }
            #network {
              color: @blue;
            }
            #network.disconnected {
              color: rgb(255, 255, 255);
            }
            #battery {
              color: @green;
            }
            #battery.charging, #battery.full, #battery.discharging {
              color: @green;
            }
            #battery.critical:not(.charging) {
              color: @red;
            }
            #bluetooth {
              color: @violet;
            }
            #custom-powermenu {
              color: @red;
            }
            #custom-spotify{
      	color: @subtext01;
            }
    '';
  }
}
