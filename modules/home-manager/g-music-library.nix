# Config group for systems with access to my music library.
{ pkgs, ... }: {
  imports = [
    ./beets
    ./mpd
    ./mpd-discord-rpc
    ./music-utils
    ./ncmpcpp
    ./sox
  ];

  home.packages = with pkgs; [
    mpc-cli
    mp3gain rsgain mp3splt
    (python3.withPackages (ps: with ps; [
      musicbrainzngs
    ]))
    lua
  ];
}
