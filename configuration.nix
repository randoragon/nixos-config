# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Allow instaling non-free packages
  nixpkgs.config.allowUnfree = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Network settings
  networking.hostName = "nixhost";
  networking.networkmanager.enable = true;

  # Locale settings
  time.timeZone = "Europe/Warsaw";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "pl";
    useXkbConfig = false;
  };

  # Use dash as /bin/sh
  environment.binsh = "${pkgs.dash}/bin/dash";

  # Enable services
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };
  services.libinput.enable = true;
  services.ntp.enable = true;
  services.printing.enable = true;

  # XDG Desktop Portal for PipeWire screensharing etc.
  xdg.portal = {
    enable = true;
    config.common.default = [ "wlr" ];
  };

  # Enable bluetooth support
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    package = pkgs.bluez;
  };

  # Allow waylock to authenticate (https://github.com/swaywm/sway/issues/2773#issuecomment-427570877)
  security.pam.services.waylock = {
    text = "auth include login";
  };

  # Fonts
  fonts.packages = with pkgs; [
    jetbrains-mono
    dejavu_fonts
    texlivePackages.opensans
    font-awesome
    ipafont
    liberation_ttf
    carlito
    libertinus
    unifont
  ];

  # System-wide packages
  environment.systemPackages = with pkgs; [
    bash dash
    firefox
    discord
    thunderbird
    sxiv oculante mpv
    xarchiver
    lf tmux tree jq ripgrep fzf
    curl wget htop file
    gnupg pinentry-curses pinentry-gtk2
    iputils wpa_supplicant nettools wirelesstools
    udisks
    qpwgraph pulsemixer
    dosfstools
    inxi pciutils neofetch
    zip unzip p7zip rar
    bc libqalculate
    rsync
    trash-cli
    imagemagick graphicsmagick
    numix-icon-theme
    ffmpeg sox
  ];

  # Enable programs
  programs.mtr.enable = true;
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
  };
  programs.river = {
    enable = true;
    extraPackages = with pkgs; [
      rivercarro
      foot
      swayidle
      waylock
      swww
      yambar
      bemenu
      libnotify mako
      gammastep
      grim slurp swappy
      wl-clipboard wlr-randr
    ];
  };
  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gtk2;
  };
  programs.ssh.startAgent = true;

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
      python3 python312Packages.pip pyright ruff
      binutils
      meld
      unixtools.xxd

      # Typesetting / presentation
      zathura
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
      python312Packages.pygobject3
      python312Packages.musicbrainzngs
      python312Packages.pyacoustid
      python312Packages.requests
      python312Packages.pylast
      python312Packages.pyxdg
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
