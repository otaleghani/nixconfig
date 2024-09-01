{ config, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    obs-studio
    gimp          # Photoshop
    inkscape      # Illustrator
    kdenlive      # Premiere Pro
    natron        # After Effects
    darktable     # Lightroom
    audacity      # Audition
    scribus       # InDesign
    synfigstudio  # Animate
    bluefish      # Dreamweaver
    penpot        # XD
    pdfsam        # Acrobat Pro
  ];
}
