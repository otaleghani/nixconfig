# https://mynixos.com/home-manager/options/programs.tmux
{ config, pkgs, ... }: {
  programs.tmux = {
    enable = true;
    plugins = with pkgs; [ tmuxPlugins.resurrect tmuxPlugins.continuum ];
    extraConfig = ''
      # defaults
      set -g default-terminal screen-256color
      set -g default-command fish
      # set -g default-shell fish
      set -g mouse on

      # prefix
      unbind C-b
      set-option -g prefix F12
      bind-key F12 send-prefix

      # split panes
      bind C-l split-window -h
      bind C-h split-window -hb
      bind C-j split-window -v
      bind C-k split-window -vb
      unbind '"'
      unbind %

      # move trough panes
      bind l select-pane -R
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U

      # kill pane
      bind q kill-pane

      # windows
      bind n new-window
      bind r command-prompt -I "#W" "rename-window '%%'"
      bind , previous-window
      bind . next-window

      # ricing
      #setw -g clock-mode-colour '#${config.colorScheme.palette.subtext01}'
      set -g status-position top
      set -g status-justify left
      set -g status-bg "#${config.colorScheme.palette.surface00}"
      set -g status-fg "#${config.colorScheme.palette.subtext01}"
      set -g status-left '    '
      set -g status-left-length 20
      set -g status-right ' %Y-%m-%d %H:%M '
      set -g status-right-length 50

      setw -g window-status-current-style 'fg=#${config.colorScheme.palette.base} bg=#${config.colorScheme.palette.orange} bold'
      setw -g window-status-current-format ' #I #W #F ' 
      setw -g window-status-style 'fg=#${config.colorScheme.palette.base} dim' 
      setw -g window-status-format ' #[fg=#${config.colorScheme.palette.overlay00}]#I #[fg=#${config.colorScheme.palette.overlay00}]#W #[fg=#${config.colorScheme.palette.overlay00}]#F ' 
    '';
  };
}

