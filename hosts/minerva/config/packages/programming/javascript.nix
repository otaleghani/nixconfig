{ config, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    nodejs_22
    nodePackages.pnpm
  ];
}
