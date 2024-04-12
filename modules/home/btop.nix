{ config, pkgs, ... }:

{
  #Btop
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "TTY";
      theme_background = false;
      truecolor = true;
      force_tty = false;
      vim_keys = true;
      rounded_corners = true;
      graph_symbol = "braille";
      update_ms = 1000;
      proc_sorting = "cpu direct";
    };
  };
}
