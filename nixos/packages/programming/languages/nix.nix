{ pkgs, ... }: 
{
  environment.systemPackages = with pkgs; [
    nix
    nixfmt
    nixpkgs-fmt
    nix-lsp
    nix-diff
    nix-prefetch-git
  ];
}
