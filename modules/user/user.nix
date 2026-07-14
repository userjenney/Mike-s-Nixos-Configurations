{

  pkgs,
  ...
}:

{
  programs.bash = {
    enable = true;
    interactiveShellInit = ''
      # "check if parent process is not fish" && "make nested shells work properly"
      if grep -qv fish /proc/$PPID/comm && [[ $SHLVL == [12] ]]; then
          # set $SHELL for better integration with programs like nix shell, tmux, etc.
          SHELL=${pkgs.fish}/bin/fish exec fish
      fi
    '';
  };

  programs.zsh = {
    enable = true;
  };

  programs.fish = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    grc
  ];

  users.users.nic = {
    isNormalUser = true;
    shell = pkgs.bash;
    hashedPassword = "$y$j9T$riuS4fG5mYWmq.pdcJ6Zp/$ZJf6LQvGFdEYrXt7eQd1t.n3TI/XhnRuJb46eUHiSB2";
    extraGroups = [
      "wheel"
      "adbusers"
      "audio"
      "video"
      "networkmanager"
      "input"
      "libvirtd"
      "vboxuser"
    ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
    ];
  };
}
