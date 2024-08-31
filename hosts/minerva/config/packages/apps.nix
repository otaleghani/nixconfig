{ config, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    inkscape
    gimp
    obs-studio
  ];
}
