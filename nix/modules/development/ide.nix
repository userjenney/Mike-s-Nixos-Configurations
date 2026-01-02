{ pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    jetbrains.idea-oss
  ];
}
