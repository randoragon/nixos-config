# Config group for systems with software development support.
{ pkgs, ... }: {
  imports = [
    ./go
    ./lua
    ./node
    ./python
    ./R
    ./rust
  ];

  home.packages = with pkgs; [
    unixtools.xxd hyx
    perf hotspot
    sshfs
    glibcInfo
    man-pages
  ];
}
