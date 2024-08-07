{
  programs.yt-dlp = {
    enable = true;
    settings = {
      embed-thumbnail = true;
      embed-chapters = true;
      embed-subs = true;
      sub-langs = "all";
    };
  };
}
