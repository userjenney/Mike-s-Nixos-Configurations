{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    #python311Packages.python-lsp-server
    nodemon
    #pkgs.typescript
    #pkgs.typescript-language-server
    vscode-langservers-extracted
    yaml-language-server
    bash-language-server
    graphql-language-service-cli
    dockerfile-language-server
    vue-language-server
    lua-language-server
    marksman
    markdown-oxide
    nil
    #zls
    gopls
    delve
    emmet-language-server
    buf
    cmake-language-server
    docker-compose-language-service
    vscode-extensions.vadimcn.vscode-lldb
    slint-lsp
    terraform-ls
    hyprls
    #helix
    nodejs
    pyright
    rust-analyzer
    lua-language-server
    haskellPackages.haskell-language-server
  ];
}
