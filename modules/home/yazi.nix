{ config, pkgs, ... }:
{
  #Yazi
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      manager = {
        show_hidden = false;
        sort_by = "natural";
        sort_dir_first = true;
        sort_reverse = false;
      };
    };
  };
  home.file.".config/yazi/init.lua".source = ../.././dotfiles/yazi/init.lua;
}
