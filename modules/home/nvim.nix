{config, pkgs, ...}:

{
  programs.neovim= {
    enable = true;
    plugins = with pkgs.vimPlugins; [  ];
#    settings = { ignorecase = true; };
    extraConfig = ''
      set mouse=a
    '';
  };
}
