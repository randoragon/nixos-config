{ lib, config, pkgs, ... }: {
  home.activation = let
    configSrc = "/home/pcache/nixos-config/modules/home-manager/tone3000/config";
    configDest = "${config.xdg.configHome}/TONE3000";
    tone3000Plugin = "${config.xdg.userDirs.extraConfig.ASSETS}/audio/plugins/vst3/TONE3000/Contents/x86_64-linux/TONE3000.so";
    patchelf = "${pkgs.patchelf}/bin/patchelf";
  in {
    # Symlink config to track new presets with git
    tone3000config = lib.hm.dag.entryAfter ["writeBoundary"] ''
      run sh -c '
        mkdir -p -- "${configDest}/.."
        if [ -e "${configDest}" ] && [ ! -L "${configDest}" ]; then
            mv -- "${configDest}" "${configDest}.orig"
        fi
        ln -sfT -- "${configSrc}" "${configDest}"
      '
    '';

    # Use patchelf to fix TONE3000 dependencies. FIXME: Hopefully this will one
    # day not be needed anymore when a tone3000 package shows up in nixpkgs.
    tone3000patchelf = lib.hm.dag.entryAfter ["writeBoundary"] ''
      run sh -c '
        if [ -f "${tone3000Plugin}" ]; then
            ${patchelf} --remove-rpath "${tone3000Plugin}"
            ${patchelf} --add-rpath "${pkgs.libx11}/lib" "${tone3000Plugin}"
            ${patchelf} --add-rpath "${pkgs.alsa-lib}/lib" "${tone3000Plugin}"
            ${patchelf} --add-rpath "${pkgs.fontconfig.lib}/lib" "${tone3000Plugin}"
        fi
      '
    '';
  };
}
