# Config group for systems that support various types of media.
{ pkgs, ... }: {
  imports = [
    ./olive
    ./sox
    ./yt-dlp
  ];

  home.packages = with pkgs; [
    # Audio
    qpwgraph pulsemixer
    ffmpeg
    poppler_utils

    # Video / images
    imagemagick graphicsmagick
    mpv
    pinta
  ];
}
