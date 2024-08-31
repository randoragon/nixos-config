{ pkgs, ... }: {
  home.packages = with pkgs; [ newsraft ];

  xdg.configFile."newsraft/config".source = ./config;

  home.file.".scripts/rss-thumbnail".source = ./scripts/rss-thumbnail;
  home.file.".scripts/rss-stream-browser".source = ./scripts/rss-stream-browser;
  home.file.".scripts/rss-mpv-browser".source = ./scripts/rss-mpv-browser;
  home.file.".scripts/rss-youtube-dl".source = ./scripts/rss-youtube-dl;
}
