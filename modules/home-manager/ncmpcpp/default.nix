{ pkgs, config, lib, ... }: {
  programs.ncmpcpp = {
    enable = true;
    package = pkgs.ncmpcpp.override {
      visualizerSupport = true;
      clockSupport = true;
      taglibSupport = false;
    };

    bindings = [
      { key = "j"; command = "scroll_down"; }
      { key = "k"; command = "scroll_up"; }
      { key = "J"; command = [ "select_item" "scroll_up" ]; }
      { key = "K"; command = [ "select_item" "scroll_down" ]; }

      { key = "h"; command = "previous_column"; }
      { key = "l"; command = "next_column"; }

      { key = "G"; command = "move_end"; }
      { key = "g"; command = "move_home"; }

      { key = "h"; command = "jump_to_parent_directory"; }
      { key = "l"; command = "enter_directory"; }
      { key = "left"; command = "jump_to_parent_directory"; }
      { key = "right"; command = "enter_directory"; }

      { key = "ctrl-u"; command = "page_up"; }
      { key = "ctrl-d"; command = "page_down"; }

      { key = "ctrl-k"; command = "move_sort_order_up"; }
      { key = "ctrl-j"; command = "move_sort_order_down"; }
      { key = "ctrl-k"; command = "move_selected_items_up"; }
      { key = "ctrl-j"; command = "move_selected_items_down"; }

      { key = "+"; command = "show_clock"; }
      { key = "="; command = "volume_up"; }

      { key = "n"; command = "next_found_item"; }
      { key = "N"; command = "previous_found_item"; }

      { key = "v"; command = "select_item"; }
      { key = "V"; command = "select_range"; }
      { key = "escape"; command = "remove_selection"; }
      { key = "ctrl-c"; command = "remove_selection"; }
      { key = "ctrl-v"; command = "reverse_selection"; }

      { key = "d"; command = "delete_playlist_items"; }
      { key = "ctrl-g"; command = "jump_to_position_in_song"; }

      { key = "."; command = "show_lyrics"; }
      { key = "l"; command = "run_action"; }
    ];

    settings = {
      # Directories
      ncmpcpp_directory = "${config.xdg.configHome}/ncmpcpp";
      lyrics_directory = "${config.xdg.dataHome}/ncmpcpp/lyrics";

      # Connection settings
      mpd_connection_timeout = 5;
      mpd_crossfade_time = 3;

      # Visualizer settings
      visualizer_data_source = "/tmp/mpd_ncmpcpp.fifo";
      visualizer_output_name = "Visualizer feed";
      visualizer_in_stereo = true;
      visualizer_type = "spectrum";
      visualizer_look = "■■";
      visualizer_color = "blue, cyan, green, yellow, magenta, red";

      # Delays
      playlist_disable_highlight_delay = 0;
      message_delay_time = 1;

      # Song format
      song_list_format = ''{$4%a - }{%t}|{$8%f$9}$R{$3(%l)$9}'';
      song_status_format = ''$b{{$8"%t"}} $3by {$4%a{ $3in $7%b{ (%y)}} $3}|{$8%f}'';
      song_library_format = ''{%n - }{%t}|{%f}'';
      alternative_header_first_line_format = ''$b$1$aqqu$/a$9 {%t}|{%f} $1$atqq$/a$9$/b'';
      alternative_header_second_line_format = ''{{$4$b%a$/b$9}{ - $7%b$9}{ ($4%y$9)}}|{%D}'';
      current_item_prefix = ''$(cyan)$r$b'';
      current_item_suffix = ''$/r$(end)$/b'';
      current_item_inactive_column_prefix = ''$(magenta)$r'';
      current_item_inactive_column_suffix = ''$/r$(end)'';

      # Misc
      execute_on_song_change = "~/.scripts/ncmpcpp-song-change.sh >/dev/null 2>&1 &";
      playlist_show_remaining_time = true;
      playlist_shorten_total_times = true;
      playlist_display_mode = "columns";
      browser_display_mode = "columns";
      incremental_seeking = false;
      seek_time = 5;
      autocenter_mode = true;
      progressbar_look = "▬🔘";
      data_fetching_delay = false;
      media_library_primary_tag = "artist";
      media_library_albums_split_by_date = false;
      lyrics_fetchers = "justsomelyrics, sing365, metrolyrics, jahlyrics, plyrics, tekstowo, internet, genius, azlyrics";
      allow_for_physical_item_deletion = true;
      screen_switcher_mode = "playlist, media_library";
      startup_screen = "playlist";
      clock_display_seconds = true;
      display_volume_level = true;
      display_bitrate = true;
      ignore_leading_the = true;
      mouse_support = false;
      external_editor = "${config.home.sessionVariables.EDITOR}";
      use_console_editor = true;

      # Colors
      colors_enabled = true;
      empty_tag_color = "magenta";
      header_window_color = "magenta";
      volume_color = "default";
      state_line_color = "default";
      state_flags_color = "default:b";
      main_window_color = "white";
      color1 = "white";
      color2 = "green";
      progressbar_color = "black:b";
      progressbar_elapsed_color = "blue:b";
      statusbar_color = "red";
      statusbar_time_color = "cyan:b";
      player_state_color = "default:b";
      alternative_ui_separator_color = "black:b";
      window_border_color = "green";
      active_window_border = "red";
    };
  };

  # Create the data directory, because ncmpcpp is dumb and crashes if it doesn't exist.
  home.activation = {
    ncmpcppDataDir = lib.hm.dag.entryAfter ["writeBoundary"] ''
      run mkdir -p -- "${config.xdg.dataHome}/ncmpcpp"
    '';
  };
}
