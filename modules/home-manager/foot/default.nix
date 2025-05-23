{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "JetBrains Mono:size=10, Noto Color Emoji:size=10";
        font-italic = "JetBrains Mono:style=Italic:size=10";
        font-bold = "JetBrains Mono:style=Bold:size=10";
        font-bold-italic = "JetBrains Mono:style=Bold Italic:size=10";
        resize-by-cells = "no";
      };

      colors = {
        foreground = "dadada";
        background = "141414";
        alpha = "0.9";
      };

      key-bindings = {
        unicode-input = "none";
        scrollback-up-line = "Control+Shift+k";
        scrollback-down-line = "Control+Shift+j";
        scrollback-up-half-page = "Control+Shift+u";
        scrollback-down-half-page = "Control+Shift+d";
        scrollback-up-page = "Control+Shift+b";
        scrollback-down-page = "Control+Shift+f";
        pipe-visible = ''[sh -c "''${XDG_CONFIG_HOME:-$HOME/.config}/foot/pipe-open.sh"] Control+Shift+e'';
        pipe-scrollback = ''[sh -c "''${XDG_CONFIG_HOME:-$HOME/.config}/foot/pipe-open.sh"] Control+Shift+Mod1+e'';
      };

      search-bindings = {
        find-prev = "Control+Shift+p";
        find-next = "Control+Shift+n";
        scrollback-up-line = "Control+Shift+k";
        scrollback-down-line = "Control+Shift+j";
        scrollback-up-half-page = "Control+Shift+u";
        scrollback-down-half-page = "Control+Shift+d";
        scrollback-up-page = "Control+Shift+b";
        scrollback-down-page = "Control+Shift+f";
      };
    };
  };

  xdg.configFile."foot/pipe-open.sh" = {
    source = ./pipe-open.sh;
    executable = true;
  };

  home.sessionVariables = {
    TERMINAL = "foot";
  };
}
