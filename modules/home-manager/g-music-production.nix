# Config group for systems with music production support.
{ config, pkgs, spkgs, rsid3, ... }: {
  imports = [
    ./ardour
    ./carla
    ./lmms
    ./sox
  ];

  home.packages = with pkgs; [
    mp3gain rsgain
    (python3.withPackages (ps: with ps; [
      musicbrainzngs
    ]))

    audacity
    x42-plugins
    distrho-ports
    gxplugins-lv2
    lsp-plugins
    helm
    geonkick
    sfizz
    vmpk
    hydrogen
    zynaddsubfx
    setbfree
    lilypond
    tonelib-zoom
  ] ++ [ rsid3 ];

  # https://discourse.nixos.org/t/audio-plugins-no-longer-detected-after-switching-to-nix-2-4-flakes/17177/4
  home.sessionVariables = let
    pluginsPath = "${config.xdg.userDirs.extraConfig.XDG_PRODUCTION_DIR}/000_audio-bank/plugins";
  in {
    DSSI_PATH = "${pluginsPath}/dssi:$HOME/.nix-profile/lib/dssi:/run/current-system/sw/lib/dssi:/etc/profiles/per-user/$USER/lib/dssi";
    LADSPA_PATH = "${pluginsPath}/ladspa:$HOME/.nix-profile/lib/ladspa:/run/current-system/sw/lib/ladspa:/etc/profiles/per-user/$USER/lib/ladspa";
    LV2_PATH = "${pluginsPath}/lv2:$HOME/.nix-profile/lib/lv2:/run/current-system/sw/lib/lv2:/etc/profiles/per-user/$USER/lib/lv2";
    LXVST_PATH = "$HOME/.nix-profile/lib/lxvst:/run/current-system/sw/lib/lxvst:/etc/profiles/per-user/$USER/lib/lxvst";
    VST2_PATH = "${pluginsPath}/vst2:$HOME/.nix-profile/lib/vst2:$HOME/.nix-profile/lib/vst:/run/current-system/sw/lib/vst2:/run/current-system/sw/lib/vst:/etc/profiles/per-user/$USER/lib/vst2:/etc/profiles/per-user/$USER/lib/vst";
    VST3_PATH = "${pluginsPath}/vst3:$HOME/.nix-profile/lib/vst3:/run/current-system/sw/lib/vst3:/etc/profiles/per-user/$USER/lib/vst3";
    JSFX_PATH = "$HOME/.config/REAPER/Effects";
  };
}
