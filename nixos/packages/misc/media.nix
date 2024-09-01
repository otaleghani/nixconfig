{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    cinnamon.nemo
    ncmpcpp
    mpc-cli
    mpd
    mpv
    vlc
    imv
  ];
}
