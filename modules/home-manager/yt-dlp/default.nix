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

  home.file.".local/bin/ytmp3".source = ./localbin/ytmp3;
  home.file.".local/bin/ytmp3pl".source = ./localbin/ytmp3pl;
  home.file.".local/bin/ytmp4".source = ./localbin/ytmp4;
  home.file.".local/bin/ytmp4pl".source = ./localbin/ytmp4pl;
}
