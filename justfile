offline:
  sudo nixos-rebuild switch --flake --keep-going --offline

deploy:
  sudo nixos-rebuild switch --flake --keep-going

time:
  sudo nix flake update

fmt:
  sudo treefmt -v --tree-root ./
