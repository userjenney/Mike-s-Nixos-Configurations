# home.nix 中的 programs.tmux 部分
{
  programs.tmux = {
    enable = true;
    # 快捷键前缀
    prefix = "C-a";
    # 从 C-a 发送到终端
    keyMode = "emacs";
    # 终端类型
    terminal = "tmux-256color";
    # 鼠标支持
    mouse = true;
    # 基础设置
    extraConfig = ''
      # 窗口索引从1开始
      set -g base-index 1
      set -g pane-base-index 1

      # 重新加载配置文件
      bind r source-file ~/.config/tmux/tmux.conf \; display "Config reloaded!"

      # 分割窗口
      bind | split-window -h
      bind - split-window -v

      # 使用 vim 方向键切换 pane
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # 调整 pane 大小（按住 Alt 并移动）
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5

      # 状态栏美化（使用 tpm 插件）
      set -g status-position top
      set -g status-style bg=default,fg=white
      set -g status-left "#[fg=green]#S #[fg=default]|"
      set -g status-right "#[fg=yellow]%Y-%m-%d %H:%M "

      # 开启 True Color
      set -g default-terminal "tmux-256color"
      set -ga terminal-overrides ",*256col*:Tc"

      # TPM 插件管理
      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'tmux-plugins/tmux-sensible'
      set -g @plugin 'tmux-plugins/tmux-resurrect'
      set -g @plugin 'tmux-plugins/tmux-continuum'
      set -g @plugin 'catppuccin/tmux'  # 可选主题

      # 插件配置
      set -g @continuum-restore 'on'
      set -g @resurrect-capture-pane-contents 'on'

      # 初始化 TPM (必须在文件末尾)
      run '~/.config/tmux/plugins/tpm/tpm'
    '';

    # 插件目录由 TPM 管理，但需要先克隆 TPM
    # 你可以手动运行：git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
  };
}
