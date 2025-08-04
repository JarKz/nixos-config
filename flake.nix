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

    lc-niri = {
      url = "github:jarkz/layout-carousel-niri";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xwayland-satellite = {
      url = "github:Supreeeme/xwayland-satellite";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
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

      homeConfigurations.jarkz = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."${system}";
        extraSpecialArgs = {
          username = "jarkz";
          overlays = {
            rust-overlay = inputs.rust-overlay;
          };

          flake-pkgs = {
            xwayland-satellite = inputs.xwayland-satellite.packages."${system}";
            lc-niri = inputs.lc-niri.packages."${system}";
          };

          tools = {
            importConfig = import ./tools/import-config.nix;
            templateConfig = import ./tools/template-config.nix;
          };

          misc = import ./misc;
        };
        modules = [
          inputs.noti-flake.homeModules.default
          inputs.zen-browser.homeModules.twilight
          inputs.catppuccin.homeModules.default
          ./home
        ];
      };
    };
}

