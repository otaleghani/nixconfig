{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    git
    neovim
    make
    cmake
    gnumake
    jq
    direnv
    ripgrep
    httpie
  ];
}
