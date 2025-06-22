{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mold
    gcc
    clang
    lld
    lldb
    musl
    jdk11
    dioxus-cli
    surrealdb
    surrealdb-migrations
    surrealist
    trunk
    sqlx-cli
    gnumake
    cmake
    libgccjit
    SDL2
    sdl3
  ];
}
