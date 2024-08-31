{ config, pkgs, inputs, ... }: {

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf
    inter
    geist-font
  ];

  fonts.fontconfig.defaultFonts.monospace = [ 
    "JetBrainsMono Nerd Font" 
    "Noto Sans Mono CJK JP" 
  ];

  fonts.fontconfig.defaultFonts.serif = [ 
    "Liberation Serif" 
  ];

  fonts.fontconfig.defaultFonts.sansSerif = [ 
    "Geist" 
  ];

  fonts.fontconfig.defaultFonts.emoji = [ 
    "Noto Sans Color Emoji" 
  ];
}
