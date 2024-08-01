{ config, lib, pkgs, ... }: {

  imports =
    [
      ./hardware-configuration.nix
      ../../modules/common
    ];

  # Set hostname
  networking.hostName = "nixos";

  # User configuration
  users.users.pcache = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      # Development tools
      git lazygit patch
      neovim tree-sitter nodejs
      gcc gdb valgrind gnumake cmake pkg-config
      bear clang
      vscode-langservers-extracted  # HTML, CSS, JSON, Markdown, ESLint
      zig zls
      lua lua-language-server
      nodePackages.bash-language-server shellcheck
      rustc cargo rustfmt clippy rust-analyzer
      tokei highlight
      (python3.withPackages (ps: [ ps.pip ]))
      pyright ruff
      binutils
      meld
      unixtools.xxd

      # Typesetting / presentation
      md4c graphviz gnuplot
      (texliveBasic.withPackages (ps: with ps; [
        collection-latexrecommended
        collection-fontsrecommended
        collection-latexextra
        collection-plaingeneric
        collection-langcjk
        collection-binextra
        collection-bibtexextra
      ])) texlab biber
      typst typst-lsp
      farbfeld
      mscgen

      # Music listening
      mpd mpc-cli
      (ncmpcpp.override { visualizerSupport = true; clockSupport = true; taglibSupport = false; })
      chromaprint
      gst_all_1.gstreamer
      gst_all_1.gst-plugins-good
      gst_all_1.gst-plugins-bad
      gst_all_1.gst-plugins-ugly
      atomicparsley
      mp3info mp3gain rsgain
      mpd-discord-rpc
      (python3.withPackages (ps: with ps; [
        pygobject3
        musicbrainzngs
        pyacoustid
        requests
        pylast
        pyxdg
      ]))
      beets-unstable

      # Music production
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

      # Misc applications
      discord
      syncthing
      pass-wayland
      yt-dlp
      obs-studio
      figlet sl asciiquarium
      newsraft
      onedrive
    ];
    shell = pkgs.zsh;
  };


  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05";
}
