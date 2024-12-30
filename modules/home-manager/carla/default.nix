{ config, pkgs, lib, ... }: {
  home.packages = with pkgs; [ carla ];

  # Unfortunately the sessionVariables are not visible from the activation
  # script. Perhaps there's a way to achieve it, but I was desperate for
  # a working solution so I resorted to manually exporting everything.
  home.activation = {
    carlaInitialConfig = lib.hm.dag.entryAfter ["writeBoundary"] ''
      run sh -c '
          export DSSI_PATH="${config.home.sessionVariables.DSSI_PATH}"
          export LADSPA_PATH="${config.home.sessionVariables.LADSPA_PATH}"
          export LV2_PATH="${config.home.sessionVariables.LV2_PATH}"
          export LXVST_PATH="${config.home.sessionVariables.LXVST_PATH}"
          export VST2_PATH="${config.home.sessionVariables.VST2_PATH}"
          export VST3_PATH="${config.home.sessionVariables.VST3_PATH}"
          export JSFX_PATH="${config.home.sessionVariables.JSFX_PATH}"
          ${builtins.toPath ./setup.sh}
      '
    '';
  };
}
