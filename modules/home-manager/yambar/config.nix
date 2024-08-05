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
        river = let
          on-click = {
            left = "sh -c 'riverctl set-focused-tags $((1 << ({id} - 1)))'";
            right = "sh -c 'riverctl toggle-focused-tags $((1 << ({id} - 1)))'";
          };
          focus-string = {
            deco.background.color = "666666ff";
            margin = 5;
            text = "{id}";
            inherit on-click;
          };
          urgent-string = {
            deco.background.color = "ff4444ff";
            margin = 5;
            text = "{id}";
            inherit on-click;
          };
          tag-default = name: {
            string = {
              margin = 5;
              text = "${name}";
              inherit on-click;
            };
          };
          tag-focused = name: {
            string = {
              deco.background.color = "666666ff";
              margin = 5;
              text = "${name}";
              inherit on-click;
            };
          };
          tag-urgent = name: {
            string = {
              deco.background.color = "ff4444ff";
              margin = 5;
              text = "${name}";
              inherit on-click;
            };
          };
          per-special-tag = hook: {
            "id == 10" = hook "w";
            "id == 11" = hook "e";
            "id == 12" = hook "d";
            "id == 13" = hook "n";
            "id == 14" = hook "m";
          };
        in {
          content = {
            map = {
              default = {
                map = {
                  default = tag-default "{id}";
                  conditions = per-special-tag tag-default;
                };
              };
              conditions = {
                "~occupied && ~focused" = empty;
                urgent = {
                  map = {
                    default = tag-urgent "{id}";
                    conditions = per-special-tag tag-urgent;
                  };
                };
                focused = {
                  map = {
                    default = tag-focused "{id}";
                    conditions = per-special-tag tag-focused;
                  };
                };
              };
            };
          };
        };
      }
    ];

    center = [
      {
        river = {
          title.string.text = "{title}";
          content = empty;
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
                left = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
                right = "qpwgraph";
              };
            };
          };
        };
      }

      module-sep

      {
        script = {
          path = "~/.scripts/yambar/storage";
          poll-interval = 10000;
          content = basic-string "{str}";
        };
      }

      module-sep

      {
        script = {
          path = "~/.scripts/yambar/gpg_expire";
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
