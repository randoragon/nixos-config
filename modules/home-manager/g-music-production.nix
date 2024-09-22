# Config group for systems with music production support.
{ pkgs, ... }: {
  imports = [
    ./lmms
  ];

  home.packages = with pkgs; [
    sox
    mp3gain rsgain
    (python3.withPackages (ps: with ps; [
      musicbrainzngs
    ]))

    carla
    x42-plugins
    helm
    geonkick
    distrho
    sfizz
    vmpk
    ardour
    hydrogen
    zynaddsubfx
    linuxsampler qsampler
    setbfree
  ];

  # https://discourse.nixos.org/t/audio-plugins-no-longer-detected-after-switching-to-nix-2-4-flakes/17177/4
  home.sessionVariables = {
    DSSI_PATH = "$HOME/.dssi:$HOME/.nix-profile/lib/dssi:/run/current-system/sw/lib/dssi:/etc/profiles/per-user/$USER/lib/dssi";
    LADSPA_PATH = "$HOME/.ladspa:$HOME/.nix-profile/lib/ladspa:/run/current-system/sw/lib/ladspa:/etc/profiles/per-user/$USER/lib/ladspa";
    LV2_PATH = "$HOME/.lv2:$HOME/.nix-profile/lib/lv2:/run/current-system/sw/lib/lv2:/etc/profiles/per-user/$USER/lib/lv2";
    LXVST_PATH = "$HOME/.lxvst:$HOME/.nix-profile/lib/lxvst:/run/current-system/sw/lib/lxvst:/etc/profiles/per-user/$USER/lib/lxvst";
    VST_PATH = "$HOME/.vst:$HOME/.nix-profile/lib/vst:/run/current-system/sw/lib/vst:/etc/profiles/per-user/$USER/lib/vst";
  };
}
