{ config, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    waybar
    rofi-wayland
    hyprpaper
    wl-clipboard
    libnotify
    mako
    inotify-tools
    fcitx5
  ];
}
