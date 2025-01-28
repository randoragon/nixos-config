# Config group for systems that support various types of media.
{ pkgs, ... }: {
  imports = [
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
    olive-editor
    mpv
    pinta
  ];
}
