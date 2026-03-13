{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    extraConfig = ''
      # ~/.tmux.conf
      # ╭──────────────────────────────────────────────────────────╮
      # │                         Shell                            │
      # ╰──────────────────────────────────────────────────────────╯
      # set -g default-command "exec zsh -l"
      # set-option -g default-command "reattach-to-user-namespace -l $SHELL"

      # ╭──────────────────────────────────────────────────────────╮
      # │                         Prefix                           │
      # ╰──────────────────────────────────────────────────────────╯
      unbind C-b
      set -g prefix `
      bind ` send-prefix

      # ╭──────────────────────────────────────────────────────────╮
      # │                         Options                          │
      # ╰──────────────────────────────────────────────────────────╯
      set -g default-terminal "tmux-256color"
      setoption -sa terminal-overrides ",xterm*:Tc"
      set -g base-index 1
      set -g pane-base-index 1
      set -g renumber-windows on
      set -g mouse on
      set -g set-clipboard on  # ensure wl-copy is installed

      # -- vi mod
      # prefix + [ 进入复制模式
      # v 选择文本  y 复制文本  enter 复制并退出复制模式
      # /,? 搜索文本
      # set -g mode-keys vi
      # set -g status-keys vi
      set-window-option -g mode-keys vi

      # ╭──────────────────────────────────────────────────────────╮
      # │                       functions                          │
      # ╰──────────────────────────────────────────────────────────╯
      # none

      # ╭──────────────────────────────────────────────────────────╮
      # │                        bindkeys                          │
      # ╰──────────────────────────────────────────────────────────╯
      # window control
      bind q new-window -c "#{pane_current_path}"
      bind c kill-window
      bind -r n next-window
      bind -r p previous-window
      # Move the current window to the next window or previous window position
      bind -r N run-shell "tmux swap-window -t $(expr $(tmux list-windows | grep \"(active)\" | cut -d \":\" -f 1) + 1)"
      bind -r P run-shell "tmux swap-window -t $(expr $(tmux list-windows | grep \"(active)\" | cut -d \":\" -f 1) - 1)"

      # pane control
      bind t split-window -h -c "#{pane_current_path}"
      bind w kill-pane
      bind -n M-h split-window -h -c "#{pane_current_path}"  # split-window -h
      bind -n M-v split-window -v -c "#{pane_current_path}"  # split-window -v
      # prefix + hjkl to switch active pane
      bind -r j select-pane -U
      bind -r k select-pane -D
      bind -r h select-pane -L
      bind -r l select-pane -R
      # alt + hjkl to resize current pane
      bind -r M-j resize-pane -U 5
      bind -r M-k resize-pane -D 5
      bind -r M-h resize-pane -L 5
      bind -r M-l resize-pane -R 5
      # or use HJKL to resize current pane
      # bind J resize-pane -U 5
      # bind K resize-pane -D 5
      # bind H resize-pane -L 5
      # bind L resize-pane -R 5
      # default bindkeys:
      # prefix + z  # switch the pane max/min 
      # prefix + x  # close the pane
      # prefix + "  # split the pane horizontally
      # prefix + %  # split the pane vertically
      # prefix + o  # switch active pane

      # vi mod
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

      # other
      bind u clock-mode
      bind s choose-tree -w
      bind e display-panes

      # `prefix r` to reload of the config file
      unbind r
      bind r source-file ~/.tmux.conf\; display-message '~/.tmux.conf reloaded'

      # show a promp to kill a window by id with `prefix X`
      bind-key X command-prompt -p "kill window" "kill-window -t '%%'"

      # fzf integration
      # search sessions
      bind C-e display-popup -E "\
        tmux list-sessions -F '#{?session_attached,,#{session+name}}' | \
        sed '/^$/d' |\
        fzf --reverse --header jump-to-session |\
        xargs tmux switch-client -t"

      # search windows in current session
      bind C-f display-popup -E "\
        tmux list-windows -F '#{window_index} #{window_name}' |\
        sed '/^$/d' |\
        fzf --reverse --header jump-to-window |\
        cut -d ' ' -f 1 |\
        xargs tmux select-window -t"
    '';

    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.vim-tmux-navigator  # enhance tmux and vim navigation
      tmuxPlugins.yank  # Use the system clipboard as the default register
      # tmuxifier  # session, window & pane management for Tmux
      tmuxPlugins.tmux-fzf  # Use fzf to manage your tmux work environment
      tmuxPlugins.tmux-floax  # Floating pane for Tmux
      {
        plugin = pkgs.tmuxPlugins.catppuccin;
        extraConfig = "set -g @catppuccin_flavour 'mocha'";
      }
      # {
      #   plugin = pkgs.tmuxPlugins.resurrect;
      #   extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      # }
      # {
      #   plugin = pkgs.tmuxPlugins.continuum;
      #   extraConfig = ''
      #     set -g @continuum-restore 'on'
      #     set -g @continuum-save-interval '15'
      #   '';
      # }
    ];  
  };
  home.packages = with pkgs; [ tmuxifier ];
  # home.file = {
  #   ".config/tmux/tmux.conf".source = config.lib.file.mkOutOfStoreSymlink "/home/nix/.tmux.conf";
  # };  # => ln -s /home/nix/.config/tmux.conf ~/.tmux.conf
  # home.file.DST_PATH.source = config.lib.file.mkOutOfStoreSymlink SRC_PATH;
}
