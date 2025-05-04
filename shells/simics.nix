# A development shell for working with Intel Simics emulator and Intel Simics
# Package Manager (ISPM).
# Tested on intel-simics-package-manager-1.12.0 and simics-7.21.0.
#
# Assumes all programs are installed in under ~/Software/simics, e.g.:
# - simics/intel-simics-package-manager-1.12.0/
# - simics/simics/simics-7.21.0/
# If this is not the case, adjust SIMICS_BASE env accordingly.
let
  pkgs = import <nixpkgs> {};
in (pkgs.buildFHSEnv {
    name = "linux-fhs";
    targetPkgs = pkgs: with pkgs; [
      gcc
      openssl
      pkg-config

      # For ispm-gui
      glib
      libgbm
      nss
      nspr
      dbus
      atk
      cups
      xorg_sys_opengl
      gtk3
      pango
      cairo
      xorg.libX11
      xorg.libXcomposite
      xorg.libXdamage
      xorg.libXfixes
      xorg.libXrandr
      mesa
      expat
      xorg.libxcb
      libxkbcommon
      alsa-lib
      at-spi2-atk
      xorg_sys_opengl
      gdk-pixbuf
      eudev

      # For Simics
      bash
      gtk2
      fontconfig.lib
      freetype
      curl
      (python3.withPackages (ps: with ps; [
        pip
        wxpython
        distro
        flake8
        six
        psutil
        pyyaml
        ply
        pyflakes
        pycodestyle
        mccabe
        ipyxact
        wheel
        typing-extensions
      ]))

      # For craff utils
      libuuid.lib

      # For image manipulation
      cdrkit
      squashfsTools
    ];

    profile = ''
      export SIMICS_BASE=${builtins.getEnv "HOME"}/Software/simics/simics/simics-7.21.0/
    '';
  }).env
