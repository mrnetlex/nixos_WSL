{ config
, pkgs
, ...
}: {
  # Basics
  home.username = "netlex";
  home.homeDirectory = "/home/netlex";

  home.stateVersion = "23.11"; # Don't touch if not needed, read wiki.
  # Imports
  imports = [
    ./modules/home/default.nix
  ];

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/netlex/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "micro";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  #Starship
  home.file.".config/starship.toml".source = ./dotfiles/starship.toml;

  #Spotify-player
  home.file.".config/spotify-player/app.toml".source = ./dotfiles/spotify-player/spotify-player.toml;
  home.file.".config/spotify-player/theme.toml".source = ./dotfiles/spotify-player/theme.toml;
}
