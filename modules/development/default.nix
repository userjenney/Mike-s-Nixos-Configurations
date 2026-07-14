{ config, pkgs, ... }:

{
  imports = [
    ./console-utils.nix
    ./lsp.nix
    ./fhs.nix
    ./utils.nix
    ./wine.nix
    ./rust.nix
  ];
}
