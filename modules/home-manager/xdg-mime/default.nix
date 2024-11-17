{ pkgs, ... }: {
  xdg.mime.enable = true;

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # Documents
      "application/pdf" = [ "pdf.desktop" ];
      "text/plain" = [ "text.desktop" ];
      "text/markdown" = [ "text.desktop" ];
      "text/troff" = [ "text.desktop" ];
      "text/x-tex" = [ "text.desktop" ];
      "text/x-typst" = [ "text.desktop" ];
      "text/html" = [ "text.desktop" ];

      # Code
      "application/x-shellscript" = [ "text.desktop" ];
      "text/x-script.python" = [ "text.desktop" ];
      "text/x-python3" = [ "text.desktop" ];
      "text/x-c" = [ "text.desktop" ];
      "text/x-csrc" = [ "text.desktop" ];
      "text/x-chdr" = [ "text.desktop" ];
      "text/x-makefile" = [ "text.desktop" ];
      "text/x-lua" = [ "text.desktop" ];
      "text/x-ruby" = [ "text.desktop" ];
      "text/rust" = [ "text.desktop" ];
      "text/x-lilypond" = [ "text.desktop" ];

      # Audio
      "audio/mpeg" = [ "mpv.desktop" ];
      "audio/x-wave" = [ "mpv.desktop" ];
      "audio/x-wav" = [ "mpv.desktop" ];
      "audio/ogg" = [ "mpv.desktop" ];
      "audio/x-hx-aac-adts" = [ "mpv.desktop" ];

      # Images
      "image/gif" = [ "image.desktop" ];
      "image/png" = [ "image.desktop" ];
      "image/jpeg" = [ "image.desktop" ];
      "image/svg" = [ "image.desktop" ];
      "image/svg+xml" = [ "image.desktop" ];
      "image/webp" = [ "image.desktop" ];

      # Video
      "application/mpeg" = [ "mpv.desktop" ];
      "video/mp4" = [ "mpv.desktop" ];
      "video/x-matroska" = [ "mpv.desktop" ];

      # Misc
      "inode/directory" = [ "file.desktop" ];
      "inode/x-empty" = [ "text.desktop" ];
      "application/octet-stream" = [ "text.desktop" ];
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = [ "libreoffice-writer.desktop" ];
      "application/zip" = [ "xarchiver.desktop" ];
      "application/xml" = [ "text.desktop" "firefox.desktop" ];
      "application/rss+xml" = [ "text.desktop" "firefox.desktop" ];
      "application/atom+xml" = [ "text.desktop" "firefox.desktop" ];
      "application/json" = [ "text.desktop" "firefox.desktop" ];
      "application/x-xbel" = [ "text.desktop" ];
      "application/toml" = [ "text.desktop" ];
      "text/csv" = [ "text.desktop" ];
      "text/tab-separated-values" = [ "text.desktop" ];
      "text/x-log" = [ "text.desktop" ];

      # URL Schemes
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "x-scheme-handler/about" = [ "firefox.desktop" ];
      "x-scheme-handler/unknown" = [ "firefox.desktop" ];
      "x-scheme-handler/webcal" = [ "firefox.desktop" ];
      "x-scheme-handler/mailto" = [ "thunderbird.desktop" ];
    };
  };

  xdg.desktopEntries = {

    file = {
      type = "Application";
      name = "lf";
      genericName = "File Browser";
      exec = "${pkgs.foot}/bin/foot -- ${pkgs.lf}/bin/lf -- %f";
      terminal = false;
      mimeType = [ "inode/directory" ];
    };

    image = {
      type = "Application";
      name = "nsxiv";
      genericName = "Image Viewer";
      exec = "${pkgs.nsxiv}/bin/nsxiv -- %F";
      terminal = false;
      mimeType = [
        "image/bmp" "image/gif" "image/jpeg" "image/jpg"
        "image/png" "image/svg" "image/webp" "image/tiff"
        "image/x-bmp" "image/x-portable-anymap" "image/x-portable-bitmap"
        "image/x-portable-graymap" "image/x-tga" "image/x-xpixmap"
      ];
    };

    pdf = {
      type = "Application";
      name = "Zathura";
      genericName = "PDF Reader";
      exec = "${pkgs.zathura}/bin/zathura -- %u";
      terminal = false;
      mimeType = [ "application/pdf" ];
    };

    text = {
      type = "Application";
      name = "OpenPlainText";
      genericName = "Text and Markup Viewer";
      exec = "open-plain-text %u";
      terminal = false;
      mimeType = [ "text/plain" ];
    };

    mpdplay = {
      type = "Application";
      name = "mpdplay";
      genericName = "Play with MPD";
      comment = "Script  for playing a music file through MPD";
      exec = "mpdplay -- %f";
      terminal = false;
      mimeType = [
        "audio/mpeg" "audio/ogg" "audio/wav" "audio/aac"
        "audio/flac" "audio/mp4" "audio/x-m4a" "audio/mpg"
        "audio/x-wav" "audio/x-wave" "audio/x-mp3" "audio/x-mpg"
        "application/x-flac" "application/ogg" "application/x-ogg"
        "audio/vorbis" "audio/x-vorbis" "audio/x-vorbis+ogg"
      ];
    };

  };
}
