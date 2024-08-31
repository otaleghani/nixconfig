{ config, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    ani-cli
  ];
}
