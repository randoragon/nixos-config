{
  bar = let

    # Separator to print between modules
    module-sep = {
      label.content.string.text = "|";
    };

    # Shortcut for writing basic string output
    basic-string = text: {
      string = {
        margin = 5;
        inherit text;
      };
    };

    # Shortcut for empty content
    empty = {
      empty = {};
    };

  in {
    location = "top";
    height = 20;
    background = "333333ff";

    left = [
      {
        script = {
          path = ./scripts/niri-workspace;
          content = basic-string "{str}";
        };
      }
    ];

    center = [
      {
        script = {
          path = ./scripts/niri-window-title;
          content = basic-string "{str}";
        };
      }
    ];

    right = [
      {
        pipewire.content.map.conditions = {
          "type == \"sink\"" = {
            map = {
              conditions = {
                muted = basic-string "X {cubic_volume}";
                "~muted" = basic-string "> {cubic_volume}";
              };
              on-click = {
                left = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
                right = "qpwgraph";
              };
            };
          };
        };
      }

      module-sep

      {
        script = {
          path = ./scripts/storage;
          poll-interval = 10000;
          content = basic-string "{str}";
        };
      }

      module-sep

      {
        script = {
          path = ./scripts/gpg_expire;
          poll-interval = 3600000;
          content = basic-string "{str}";
        };
      }

      module-sep

      {
        clock = {
          date-format = "%a %m/%d";
          time-format = "%H:%M:%S";
          content = {
            string = {
              margin = 5;
              text = "{date}  {time}";
              on-click = {
                left = "foot -a floatme sh -c 'cal -3 --color=always | less -R'";
              };
            };
          };
        };
      }

      {
        battery = {
          name = "BAT0";
          content = {
            map = {
              default = basic-string "*{capacity}%";
              conditions = {
                "state == \"discharging\"" = basic-string "v{capacity}%";
                "state == \"charging\"" = basic-string "^{capacity}%";
                "state == \"unknown\"" = empty;
              };
            };
          };
        };
      }
    ];
  };
}
