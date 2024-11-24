# Config group for systems that support various types of media.
{ pkgs, ... }: {
  imports = [
    ./yt-dlp
  ];

  home.packages = with pkgs; [
    # Audio
    qpwgraph pulsemixer
    ffmpeg sox
    poppler_utils

    # Video / images
    imagemagick graphicsmagick
    olive-editor
    mpv
    pinta
  ];
}
