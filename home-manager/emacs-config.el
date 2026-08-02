;; -*- lexical-binding: t; -*-
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

(global-set-key (kbd "C-c f") (lambda () (interactive) (indent-region (point-min) (point-max))))

(use-package yasnippet
  :ensure t
  :config (yas-global-mode 1))

;; lsp-mode 全局设置（针对 Rust 的额外优化）
(use-package lsp-mode
  :ensure t
  :defer t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-enable-yasnippet t)
  ;; 启用 inlay hints（类型、参数名提示，喜欢的话可开启）
  (setq lsp-rust-analyzer-server-display-inlay-hints t)
  ;; 设置 cargo watch 的命令（clippy 检查，也可设为 "check"）
  ;;(setq lsp-rust-analyzer-cargo-watch-command "clippy")
  ;; 启用过程宏（需要 nightly 或稳定版 + 过程宏支持）
  ;;(setq lsp-rust-analyzer-proc-macro-enable t)
  ;; 如果 rust-analyzer 不在 PATH 中，明确指定路径（NixOS 下可能需要）
  ;; 用 which rust-analyzer 查看实际路径，取消下面注释并修改
  (setq lsp-rust-analyzer-server-command '("/run/current-system/sw/bin/rust-analyzer"))
  )
      ;; rust-mode 配置
(use-package rust-mode
  :ensure t
  :mode "\\.rs\\'"
  :config
  ;; 保存时自动格式化（需要 rustfmt 已安装）
  (setq rust-format-on-save t)
  ;; 开启 rust-mode 的自动缩进
  (setq rust-indent-offset 4)
  ;; 添加 LSP 钩子
  (add-hook 'rust-mode-hook 'lsp-deferred))
(use-package nix-mode
  :ensure t
  :mode "\\.nix\\'"
  :config (add-hook 'nix-mode-hook 'lsp-deferred))

;; ---------- Zig 模式与 LSP ----------
(use-package zig-mode
  :ensure nil   ; 由 Nix 提供，无需下载
  :mode "\\.zig\\'"
  :config
  (setq zig-indent-offset 4)
  (setq zig-format-on-save t)
  (add-hook 'zig-mode-hook 'lsp-deferred))


;;(use-package company :ensure t :config (global-company-mode))
;;(use-package which-key :ensure t :config (which-key-mode 1))
