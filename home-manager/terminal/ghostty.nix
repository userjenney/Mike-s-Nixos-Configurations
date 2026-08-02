{
  ...
}:

{
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      font-size = 21;
      keybind = [
        "ctrl+h=goto_split:left"
        "ctrl+l=goto_split:right"
      ];
      background-opacity = 0.65;
      window-decoration = "none";
      gtk-tabs-location = "hidden";
    };
  };
}
