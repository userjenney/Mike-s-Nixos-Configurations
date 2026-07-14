{ pkgs, ... }:

{
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-lsp
    ];
    extraConfig = ''
      if executable('nil')
          augroup LspNil
              autocmd!
              autocmd User lsp_setup call lsp#register_server({
                  \ 'name': 'nil',
                  \ 'cmd': {server_info->['nil']},
                  \ 'whitelist': ['nix'],
                  \ })
          augroup END
      endif
    '';
  };

  # Home Configuration
  programs.neovim = {
    enable = true;
    extraConfig = ''
      set number relativenumber
    '';
    initLua = ''
           -- Optional, you don't have to run setup.
      require("transparent").setup({
        -- table: default groups
        groups = {
          'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
          'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
          'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
          'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
          'EndOfBuffer',
        },
        -- table: additional groups that should be cleared
        extra_groups = {},
        -- table: groups you don't want to clear
        exclude_groups = {},
        -- function: code to be executed after highlight groups are cleared
        -- Also the user event "TransparentClear" will be triggered
        on_clear = function() end,
      })
    '';
    plugins = with pkgs.vimPlugins; [
      transparent-nvim
    ];
  };

  programs.emacs = {
    enable = true;
    extraConfig = ''
                        ;; 包管理器使用清华源
      (require 'package)
      (setq package-archives
            '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
              ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
              ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
      (package-initialize)
                        (unless package-archive-contents (package-refresh-contents))

                        ;; use-package
                        (unless (package-installed-p 'use-package)
                          (package-install 'use-package))
                        (require 'use-package)
                        (setq use-package-always-ensure t)

                        ;; UI
                        (tool-bar-mode -1)
                        (menu-bar-mode -1)
                        (cua-mode 1)

                        ;; LSP 配置（插件将在 Emacs 启动时从 Melpa 安装）
                        (use-package lsp-mode
                          :ensure t
                          :defer t
                          :init (setq lsp-keymap-prefix "C-c l"))
                        (use-package lsp-ui :ensure t :after lsp-mode)
                        (use-package rust-mode
                          :ensure t
                          :mode "\\.rs\\'"
                          :config (add-hook 'rust-mode-hook 'lsp-deferred))
                        (use-package nix-mode
                          :ensure t
                  	      :mode "\\.nix\\'"
                  	      :config (add-hook 'nix-mode-hook 'lsp-deferred))
                  	
                        ;;(use-package company :ensure t :config (global-company-mode))
                        ;;(use-package which-key :ensure t :config (which-key-mode 1))
    '';
    extraPackages =
      epkgs: with epkgs; [
        use-package # 只保留 use-package，其他包让 Emacs 自己装
      ];
  };

  services.emacs = {
    enable = true;
    extraOptions = [
      "-f"
      "exwm_enable"
    ];
  };

  #  configuration of vscode
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = true;
  };
}
