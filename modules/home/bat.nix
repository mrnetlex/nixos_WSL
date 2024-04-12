{ config
, pkgs
, ...
}: {
  #Bat
  programs.bat = {
    enable = true;
    config = {
      theme = "tokyonight";
    };
    themes = {
      tokyonight = {
        src = pkgs.fetchFromGitHub {
          owner = "folke";
          repo = "tokyonight.nvim";
          rev = "610179f7f12db3d08540b6cc61434db2eaecbcff";
          sha256 = "mzCdcf7FINhhVLUIPv/eLohm4qMG9ndRJ5H4sFU2vO0=";
        };
        file = "extras/sublime/tokyonight_night.tmTheme";
      };
    };
  };
}
