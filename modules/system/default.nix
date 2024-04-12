{ config, pkgs, ... }:

{
  imports = [
	./fish.nix
	./packages.nix
	./docker.nix
	./security.nix
  ];
}
