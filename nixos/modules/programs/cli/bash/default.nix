{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    # blesh.enable = true;
    # enableLsColors = true;  # enable extra colors in `ls` to show directory listings 
    enableCompletion = true;
    # interactiveShellInit = ''
    # '';
    bashrcExtra = ''
      # docs: [ble.sh wiki](https://github.com/akinomyoga/ble.sh/wiki/Vi-(Vim)-editing-mode)
      if [[ $- == *i* ]]; then  # in interactive session
        # set -o vi
        set -o emacs
        # export EDITOR=vim  # set default editor to vim
        # export PS1='[\[\e[32m\]\h\[\e[0m\]]─[\[\e[34m\]\u\[\e[0m\]]─[\[\e[33m\]\w\[\e[0m\]]\n└──> '
        #################
        # `^[v` to enter command buffer editor, which is vim by default
        # `bind '"\C-x\C-e": edit-and-execute-command'` ^x^e to enter command buffer editor(set -o emacs first if you want to use emacs keybindings)
        #################
      fi
    '';  # run script everytime when bash init

    shellAliases = {
        cp = "cp -i";
        mv = "mv -i";
        rm = "rm -i";
        ls = "LC_ALL=C ls -alh --group-directories-first --sort=name --color=auto";
        grep = "grep -iE --color=auto";
        # cat = "bat";
        v = "nvim";
        c = "clear";
        his = "history";
        df = "df -h";
        du = "du -h";
        free = "free -h";

        # >>> git >>>
        lg = "lazygit";
        gl = "git log --all --graph --color=auto";
        gs = "git status";
        ga = "git add";
        gc = "git commit -m";
        gps = "git push";
        gpl = "git pull --rebase";
        gco = "git checkout";
        gcb = "git checkout -b";
        gplb = "git pull --rebase origin $(git rev-parse --abbrev-ref HEAD)";
        gplm = "git pull --rebase origin main";
        # <<< git <<<

        # >>> tmux >>>
        # tmux sessions manage
        tls = "tmux ls";
        tns = "tmux new-session -d -t";
        tks = "tmux kill-session -t";
        ta = "tmux attach -t";
        td = "tmux detach";
        # tmux windows manage
        tnw = "tmux new-window -n";
        tkw = "tmux kill-window -t";
        tn = "tmux next-window";
        tp = "tmux previous-window";
        # tmux panes manage
        th = "tmux split-window -h";
        tv = "tmux split-window -v";
        tsp = "tmux select-pane -t";
        tkp = "tmux kill-pane";
        # <<< tmux <<<

        # >>> fzf >>>
        fzf = "fzf --height 40% --layout reverse --border --ansi --multi";
        # <<< fzf <<<

        # >>> bat >>>
        # bat = "bat --style=plain --color=always --paging=never --theme=ansi";
        # <<< bat <<<

        # >>> nixos >>>
        hms = "home-manager switch";
        nrs = "sudo nixos-rebuild switch";
        ncg = "sudo nix-collect-garbage -d";
        # <<< nixos <<<
    };

    # keybindings
    # `^` - ctrl
    # `\e` or `^[` - alt
    # `^[[A` - up
    # `^[[B` - down
    # `^[[C` - right
    # `^[[D` - left
    # `^@` - ctrl+space or ctrl+`
    # `^_` - ctrl+/
    # `^[ ` - alt+space
    # `^[/` - alt+/
    # `^[[25~` - Fn+F1
    # `^[[26~` - Fn+F2
    # ...
    # `^[[[A` - F1 ... `^[[[E` - F5
    # `^[[[17~` - F6 ... `^[[[24~` - F12
    # `^[[1~` - Home
    # `^[[2~` - Insert
    # `^[[3~` - Delete
    # `^[[4~` - End
    # `^[[5~` - Page Up
    # `^[[6~` - Page Down
  };

  # environment.etc."bash/inputrc" = {
  #   text = ''
  #     # 设置insert模式下C-a/C-e使用emacs风格
  #     set editing-mode vi
  #     set keymap vi-insert
  #     "\C-a": beginning-of-line
  #     "\C-e": end-of-line

  #     # 保持normal模式下vim快捷键不变
  #     set keymap vi-command
  #   '';
  # };
  # 
  # system.activationScripts.createVimrc = ''
  #   if [ -d "/home/${username}" ]; then
  #     ln -sf /etc/bash/inputrc /home/${username}/.inputrc
  #     # chown ${username}:users /home/${username}/.inputrc  # rofs can not change owner
  #   fi
  # '';
}
