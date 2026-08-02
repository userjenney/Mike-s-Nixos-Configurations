offline:
  sudo nixos-rebuild switch --flake --keep-going --offline

deploy:
  sudo nixos-rebuild switch --flake --keep-going

time:
  nix flake update

fmt:
  treefmt -v --tree-root ./
