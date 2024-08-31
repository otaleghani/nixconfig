{ config, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    rustc
    rustfmt
    rustup
    cargo
    cargo-binutils
    wasm-pack
  ];
}
