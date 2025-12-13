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
    jdk17
    dioxus-cli
    #surrealdb
    #surrealdb-migrations
    #surrealist
    trunk
    sqlx-cli
    gnumake
    cmake
    libgccjit
    rustup
  ];
}
