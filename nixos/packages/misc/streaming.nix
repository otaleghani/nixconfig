{ pkgs, ... }: 
{
  environment.systemPackages = with pkgs; [
    ani-cli
    mov-cli
    python312Packages.pip
    mpv
  ];
}
