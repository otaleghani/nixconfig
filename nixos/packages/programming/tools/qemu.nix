{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    qemu
    libvirt
    virt-viewer
    ovmf
    vde2
    wireshark
    nmap
    dnsmasq
  ];
}
