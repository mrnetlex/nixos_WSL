{ config, pkgs, ... }:
{
  #Git
  programs.git = {
    enable = true;
    userName = "netlex";
    userEmail = "mrnetlex@gmail.com";
    delta.enable = true;
  };
}
