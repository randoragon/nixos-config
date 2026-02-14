{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [ carla ];

  # Disable carla quit confirmation dialog and configure paths.
  # Use activation, because we want the config file to be writeable.
  home.activation = let
    configDir = "${config.xdg.configHome}/falkTX";
    configFile = "${configDir}/Carla2.conf";
    configFileContent = ''
      [General]
      DiskFolders=${config.home.homeDirectory}, ${config.xdg.userDirs.extraConfig.ASSETS}/audio

      [Main]
      ConfirmExit=false

      [Engine]
      AudioDriver=JACK
      ProcessMode=1

      [Paths]
      DSSI=${builtins.replaceStrings [":"] [", "] config.home.sessionVariables.DSSI_PATH}
      LADSPA=${builtins.replaceStrings [":"] [", "] config.home.sessionVariables.LADSPA_PATH}
      LV2=${builtins.replaceStrings [":"] [", "] config.home.sessionVariables.LV2_PATH}
      VST2=${builtins.replaceStrings [":"] [", "] config.home.sessionVariables.VST2_PATH}
      VST3=${builtins.replaceStrings [":"] [", "] config.home.sessionVariables.VST3_PATH}
      JSFX=${builtins.replaceStrings [":"] [", "] config.home.sessionVariables.JSFX_PATH}
    '';
  in {
    carlaInitialConfig = lib.hm.dag.entryAfter ["writeBoundary"] ''
      run sh -c '
        if [ ! -f "${configFile}" ]; then
          mkdir -p -- "${configDir}"
          echo "${configFileContent}" >"${configFile}"
        fi
      '
    '';
  };
}
