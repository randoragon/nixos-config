# Config group for systems that support various types of media.
{ pkgs, ... }: {
  imports = [
    ./yt-dlp
  ];

  home.packages = with pkgs; [
    qpwgraph pulsemixer
    imagemagick graphicsmagick
    ffmpeg sox
  ];
}
