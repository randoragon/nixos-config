# Config group for systems with music production support.
{ pkgs, ... }: {
  imports = [
    ./lmms
  ];

  home.packages = with pkgs; [
    sox
    mp3info mp3gain rsgain
    (python3.withPackages (ps: with ps; [
      musicbrainzngs
    ]))

    alsa-utils
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
  ];
}
