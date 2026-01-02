{ config, pkgs, ...}:

{
  imports = [
    ./ide.nix
    ./console-utils.nix
    ./lsp.nix
    ./fhs.nix
    ./utils.nix
    ./wine.nix
  ];
}
