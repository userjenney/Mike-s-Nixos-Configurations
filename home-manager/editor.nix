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
    extraConfig = builtins.readFile ./emacs-config.el;
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
