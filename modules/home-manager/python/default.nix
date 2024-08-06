{ config, ... }: {
  # Disable ~/.python_history file (https://stackoverflow.com/a/63653039)
  config.home.sessionVariables = {
    PYTHONSTARTUP = "${config.xdg.configHome}/python/pythonrc";
  };

  config.xdg.configFile."python/pythonrc" = {
    text = ''
    import readline

    # Disable generation of ~/.python_history file
    readline.write_history_file = lambda *args: None
    '';
  };

  config.xdg.configFile."mypy/config" = {
    text = ''
      # https://mypy.readthedocs.io/en/stable/config_file.html#config-file
      # vim: ft=dosini

      [mypy]
      ignore_missing_imports = true
      allow_redefinition = true
    '';
  };
}
