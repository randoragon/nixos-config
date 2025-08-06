{
  programs.waybar = {
    enable = true;
    style = builtins.readFile ./style.css;
    settings = {
      mybar = {
        layer = "top";
        height = 20;

        modules-left = [
          "custom/niri-workspace"
        ];

        modules-center = [
          "niri/window"
        ];

        modules-right = [
          "wireplumber"
          "custom/separator"
          "custom/storage"
          "custom/separator"
          "custom/gpg-expire"
          "custom/separator"
          "clock"
          "battery"
        ];

        "custom/separator" = {
          "format" = " | ";
        };

        "custom/niri-workspace" = {
          "exec" = ./scripts/niri-workspace;
          "format" = "  {}";
        };

        wireplumber = {
          "format" = "> {volume}";
          "format-muted" = "X {volume}";
          "on-scroll-up" = "";
          "on-scroll-down" = "";
          "on-click" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          "on-click-right" = "qpwgraph";
        };

        "custom/storage" = {
          "exec" = ./scripts/storage;
          "interval" = 10;
        };

        "custom/gpg-expire" = {
          "exec" = ./scripts/gpg-expire;
          "interval" = 3600;
        };

        clock = {
          "format" = "{:%a %m/%d  %T}";
          "interval" = 1;
          "tooltip" = false;
          "on-click" = "foot -a floatme sh -c 'cal -3 --color=always | less -R'";
        };

        battery = {
          "format" = "  v{}%  ";
          "format-charging" = "  ^{}%  ";
          "format-full" = "  *{}%  ";
          "interval" = 5;
        };
      };
    };
  };
}
