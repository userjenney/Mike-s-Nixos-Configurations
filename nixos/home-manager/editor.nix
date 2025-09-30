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

}
