{ pkgs, config, lib, ... }: {
  home.packages = with pkgs; [ carla ];

  # Disable carla confirmation dialog on quit.
  # Use activation, because we want the config file to be writeable.
  home.activation = let
    config_dir = "${config.xdg.configHome}/falkTX";
    config_file = "${config_dir}/Carla2.conf";
  in {
    carlaDontAskToQuit = lib.hm.dag.entryAfter ["writeBoundary"] ''
      run sh -c '
        if [ ! -f "${config_file}" ]; then
        mkdir -p -- "${config_dir}"
        printf "[Main]\nConfirmExit=false\n" >"${config_file}"
      fi
      '
    '';
  };
}
