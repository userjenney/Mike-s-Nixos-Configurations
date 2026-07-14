{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ninja
    meson
    mold
    gcc
    clang
    lld
    lldb
    musl
    jdk11
    jdk17
    dioxus-cli
    #surrealdb
    #surrealdb-migrations
    #surrealist
    trunk
    sqlx-cli
    gnumake
    cmakeWithGui
    libgccjit
    ghc
    cabal-install
    python3
  ];
}
