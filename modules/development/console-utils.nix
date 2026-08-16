{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pahole
    nmap
    steam-run
    sassc
    fastfetch
    joe
    htop
    tree
    nix-output-monitor
    pkg-config
    nixfmt-tree
    android-tools
    wget
    rar
    p7zip
    ffmpeg-full
    links2
    unp
    xclip
    wl-clipboard
    nixfmt
    moreutils
    file
    upx
    #dotenvx
    git
    lazygit
    delta
    license-generator
    git-ignore
    gitleaks
    git-secrets
    pass-git-helper
    #jujutsu
    jjui
    just
    xh
    process-compose
    # mcfly # terminal history
    zellij
    progress
    noti
    topgrade
    ripgrep
    rewrk
    wrk2
    procs
    tealdeer
    # skim #fzf better alternative in rust
    monolith
    # taskwarrior3
    asciinema
    asciinema-agg
    aria2
    # wormhole-william
    magic-wormhole-rs
    # macchina #neofetch alternative in rust
    doggo
    sd
    ouch
    duf
    ncdu
    dust
    fd
    jq
    gh
    trash-cli
    zoxide
    tokei
    fzf
    bat
    hexyl
    mdcat
    pandoc
    lsd
    lsof
    gping
    viu
    tre-command
    yazi
    chafa

    cmatrix
    pipes-rs
    rsclock
    cava
    figlet
  ];
}
