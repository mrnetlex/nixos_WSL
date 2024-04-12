{ config
, pkgs
, ...
}: {
  #Micro
  programs.micro = {
    enable = true;
    settings = {
      colorscheme = "simple";
      autosu = true;
      mkparents = true;
      scrollbar = true;
      savecursor = true;
      clipboard = "terminal";
      hlsearch = true;
    };
  };
}
