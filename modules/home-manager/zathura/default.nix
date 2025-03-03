{
  programs.zathura = {
    enable = true;

    options = {
      statusbar-h-padding = 0;
      statusbar-v-padding = 0;
      page-padding = 1;
      font = "bitstream vera sans mono 12";
      guioptions = "shv";
      window-title-home-tilde = true;
      window-title-page = true;
      statusbar-home-tilde = true;
      scroll-step = 100;
      selection-clipboard = "clipboard";
    };

    mappings = {
      D = "toggle_page_mode";
      "<C-r>" = "reload";
      r = "rotate rotate-cw";
      R = "rotate rotate-ccw";
      K = "zoom in";
      J = "zoom out";
      i = "recolor";
      w = "adjust_window best-fit";
      e = "adjust_window width";
      "<C-j>" = "navigate next";
      "<C-k>" = "navigate previous";
      "<Button8>" = "navigate next";
      "<Button9>" = "navigate previous";
    };
  };

  home.sessionVariables = {
    PDF_READER = "zathura";
  };
}
