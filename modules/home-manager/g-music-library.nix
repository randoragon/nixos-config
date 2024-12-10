# Config group for systems with access to my music library.
{ pkgs, ... }: {
  imports = [
    ./beets
    ./mpd
    ./mpd-discord-rpc
    ./music-utils
    ./ncmpcpp
  ];

  home.packages = with pkgs; [
    sox
    mpc-cli
    mp3gain rsgain
    (python3.withPackages (ps: with ps; [
      musicbrainzngs
    ]))
    lua
  ];
}
