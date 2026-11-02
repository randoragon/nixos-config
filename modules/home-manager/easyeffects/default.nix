{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [ easyeffects ];

  # Symlink Easyeffects presets.
  # Use activation, because we want the config files to be writeable.
  home.activation = let
    configSrc = "$HOME/nixos-config/modules/home-manager/easyeffects/easyeffectsrc";
    configDest = "${config.xdg.configHome}/easyeffectsrc";
    presetsSrc = "$HOME/nixos-config/modules/home-manager/easyeffects/easyeffects";
    presetsDest = "${config.xdg.dataHome}/easyeffects";
  in {
    easyeffectsPresets = lib.hm.dag.entryAfter ["writeBoundary"] ''
      run sh -c '
        mkdir -p -- "${presetsDest}/.."
        if [ -e "${presetsDest}" ] && [ ! -L "${presetsDest}" ]; then
            mv -- "${presetsDest}" "${presetsDest}.orig"
        fi
        ln -sfT -- "${presetsSrc}" "${presetsDest}"

        if [ -e "${configDest}" ] && [ ! -L "${configDest}" ]; then
            mv -- "${configDest}" "${configDest}.orig"
        fi
        ln -sfT -- "${configSrc}" "${configDest}"
      '
    '';
  };
}
