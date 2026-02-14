{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [ distrho-ports ];

  # Set up Vitalium wavetable folders and author.
  # Additionally, create a link from ~/.local/share/Vitalium/User to ~/Assets.
  # Use activation, because we want the config file to be writeable.
  home.activation = let
    configDir = "${config.home.homeDirectory}/.vitalium";
    configFile = "${configDir}/Vitalium.config";
    configFileContent = ''
      {
        "author": "randoragon",
        "synth_version": "1.0.6",
        "data_directory": "${config.xdg.userDirs.extraConfig.ASSETS}/audio/presets/Vitalium",
        "wavetable_folders": [
          "${config.xdg.userDirs.extraConfig.ASSETS}/audio/wavetables/ESW Analog",
          "${config.xdg.userDirs.extraConfig.ASSETS}/audio/wavetables/ESW Basics",
          "${config.xdg.userDirs.extraConfig.ASSETS}/audio/wavetables/ESW Chill",
          "${config.xdg.userDirs.extraConfig.ASSETS}/audio/wavetables/ESW Digital",
          "${config.xdg.userDirs.extraConfig.ASSETS}/audio/wavetables/ESW FM",
          "${config.xdg.userDirs.extraConfig.ASSETS}/audio/wavetables/ESW Growl",
          "${config.xdg.userDirs.extraConfig.ASSETS}/audio/wavetables/ESW Instruments",
          "${config.xdg.userDirs.extraConfig.ASSETS}/audio/wavetables/ESW Metallic",
          "${config.xdg.userDirs.extraConfig.ASSETS}/audio/wavetables/ESW Modular",
          "${config.xdg.userDirs.extraConfig.ASSETS}/audio/wavetables/ESW Spectral",
          "${config.xdg.userDirs.extraConfig.ASSETS}/audio/wavetables/ESW Synth One Shots",
          "${config.xdg.userDirs.extraConfig.ASSETS}/audio/wavetables/ESW Vocal"
        ],
        "window_size": 1.0
      }
    '';
  in {
    vitaliumInitialConfig = lib.hm.dag.entryAfter ["writeBoundary"] ''
      run sh -c '
        if [ ! -f "${configFile}" ]; then
          mkdir -p -- "${configDir}"
          echo '"'"'${configFileContent}'"'"' >"${configFile}"
        fi
      '
    '';
  };
}
