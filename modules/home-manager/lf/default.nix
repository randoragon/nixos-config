{
  programs.lf.enable = true;

  xdg.configFile."lf/lfrc".source = ./lfrc;
  xdg.configFile."lf/icons".text = ''
    di        📁
    fi        📃
    tw        🤝
    ow        📂
    ln        📎
    or        ❌
    ex        🎯
    *.txt       ✍
    *.png       🖼
    *.ico       🖼
    *.jpg       📸
    *.jpeg      📸
    *.gif       🖼
    *.svg       🗺
    *.xcf       🖌
    *.html      🌎
    *.xml       📰
    *.gpg       🔑
    *.css       🎨
    *.pdf       📚
    *.djvu      📚
    *.epub      📚
    *.csv       📓
    *.xlsx      📓
    *.tex       📜
    *.md        📘
    *.mp3       🎵
    *.opus      🎵
    *.ogg       🎵
    *.m4a       🎵
    *.flac      🎼
    *.mkv       🎥
    *.mp4       🎥
    *.webm      🎥
    *.mpeg      🎥
    *.mpg       🎥
    *.avi       🎥
    *.mov       🎥
    *.wmv       🎥
    *.asf       🎥
    *.flv       🎥
    *.m4v       🎥
    *.qt        🎥
    *.zip       📦
    *.rar       📦
    *.7z        📦
    *.tar.gz    📦
    *.tar.bz    📦
    *.tar.xz    📦
    *.1         ℹ
    *.nfo       ℹ
    *.info      ℹ
    *.log       📙
    *.iso       📀
    *.img       📀
    *.part      💔
    *.torrent   🔽
    *.o         📑
    *.srt       🗚
    *.vtt       🗚
  '';
}
