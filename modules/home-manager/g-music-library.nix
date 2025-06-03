# Config group for systems with access to my music library.
{ pkgs, rsid3, music-tools, ... }: {
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
    mp3gain rsgain
    (python3.withPackages (ps: with ps; [
      musicbrainzngs
    ]))
  ] ++ [ rsid3 music-tools ];
}
