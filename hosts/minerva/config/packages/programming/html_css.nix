{ config, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    html-xml-utils
    html-tidy
  ];
}
