{ config, pkgs, ... }:

{
  imports = [
    ./bat.nix
    ./micro.nix
    ./btop.nix
    ./yazi.nix
    ./git.nix
    ./nvim.nix
  ];
}
