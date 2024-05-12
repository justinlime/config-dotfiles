{
  programs.tmux = {
    enable = true;
    prefix = "C-x";
    terminal = "xterm-256color";
    extraConfig = ''
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      bind-key v split-window -h
      bind-key s split-window -v

      bind-key -r H resize-pane -L 5
      bind-key -r J resize-pane -D 5
      bind-key -r K resize-pane -U 5
      bind-key -r L resize-pane -R 5
    '';
  };
}
