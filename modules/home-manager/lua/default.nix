{ config, ... }: {
  home.sessionVariables = {
    LUA_INIT = "@${config.xdg.configHome}/lua/init.lua";
  };

  xdg.configFile."lua/init.lua" = {
    source = ./init.lua;
  };
}
