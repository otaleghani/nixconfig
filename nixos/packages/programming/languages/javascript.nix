{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    nodejs
    npm
    yarn
    bun
    firefox
    chromium
  ];
}
