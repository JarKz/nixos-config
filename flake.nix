{
  description = "Extened JarKz's NixOS configuration.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noti-flake = {
      url = "github:jarkz/noti-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xwayland-satellite = {
      url = "github:Supreeeme/xwayland-satellite";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      specialArgs = {
        inherit system inputs;
      };
    in
    {
      nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        inherit specialArgs;
        modules = [ 
          ./hosts/desktop/configuration.nix
        ];
      };

      homeConfigurations.test = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."${system}";
        extraSpecialArgs = {
          username = "test";
          rust-overlay = inputs.rust-overlay;
          xwayland-satellite = inputs.xwayland-satellite;

          tools = {
            importConfig = ./tools/import-config.nix;
            templateConfig = ./tools/template-config.nix;
          };
        };
        modules = [ 
          inputs.noti-flake.homeModules.default
          inputs.zen-browser.homeModules.twilight
          ./home
        ];
      };
    };
}

