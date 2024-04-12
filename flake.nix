{

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    NixOS-WSL = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";    
  };

  outputs = inputs @ { self, nixpkgs, NixOS-WSL, home-manager, ... }: {
    nixosConfigurations."ASUS_B560" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        { nix.registry.nixpkgs.flake = nixpkgs; }
        ./configuration.nix
        NixOS-WSL.nixosModules.wsl
        home-manager.nixosModules.home-manager
        {
		  home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.netlex = import ./home.nix;
        }
      ];
      specialArgs = { inherit inputs; };
    };
  };

}
