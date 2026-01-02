{ pkgs, ... }:

{
  programs.vim = {
    plugins = with pkgs.vimPlugins; [
      vim-nix
    ];
    extraConfig = "
    if executable('nil')
       autocmd User lsp_setup call lsp#register_server({
       \ 'name': 'nil',
       \ 'cmd': {server_info->['nil']},
       \ 'whitelist': ['nix'],
       \ })
    endif
    ";
  };


  # Home Configuration
  programs.neovim = {
    enable = true;
    extraConfig = ''
      set number relativenumber
    '';
    viAlias = true;
    vimAlias = true;
    plugins = [
     ];
  };

  programs.emacs.enable = true;



  # alacritty - 一个跨平台终端，带 GPU 加速功能
  programs.alacritty = {
    enable = true;
    # 自定义配置
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
        draw_bold_text_with_bright_colors = true;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };



  #  configuration of vscode
  programs.vscode = {
    enable = true;
    profiles = {
    };
  };
}
