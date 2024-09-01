{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    firefox
    chromium
    surfer
  ];
}
