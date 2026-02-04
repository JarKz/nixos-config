{
  description = "Extened JarKz's NixOS configuration.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixGL = {
      url = "github:nix-community/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
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

    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wayland-pipewire-idle-inhibit = {
      url = "github:rafaelrc7/wayland-pipewire-idle-inhibit";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      specialArgs = {
        inherit system inputs;
      };

      desktopSpecs = builtins.fromTOML (builtins.readFile ./specs/desktop.toml);
      laptopSpecs = builtins.fromTOML (builtins.readFile ./specs/laptop.toml);
      laptopNoSplitKbSpecs = builtins.fromTOML (builtins.readFile ./specs/laptop-no-split-kb.toml);
    in
    {
      nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        inherit specialArgs;
        modules = [
          ./hosts/desktop/configuration.nix
        ];
      };

      nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        inherit specialArgs;
        modules = [
          ./hosts/laptop/configuration.nix
        ];
      };

      homeConfigurations =
        let
          pkgs = nixpkgs.legacyPackages."${system}";
          nixGL = inputs.nixGL;
          defaultOverlays = {
            rust-overlay = inputs.rust-overlay;
            btop-overlay = (self: super: {
              btop = super.btop.override {
                cudaSupport = true;
                rocmSupport = true;
              };
            });
          };
          flake-pkgs = {
            lc-niri = inputs.lc-niri.packages."${system}";
          };
          tools = {
            importConfig = import ./tools/import-config.nix;
            templateConfig = import ./tools/template-config.nix;
          };
          misc = import ./misc;

          defaultModules = [
            inputs.noti-flake.homeModules.default
            inputs.catppuccin.homeModules.default
            inputs.wayland-pipewire-idle-inhibit.homeModules.default
            ./home
          ];

        in
        {
          "jarkz@desktop" =
            home-manager.lib.homeManagerConfiguration {
              pkgs = pkgs;
              extraSpecialArgs = {
                username = "jarkz";
                machineSpecs = desktopSpecs;
                overlays = defaultOverlays;

                inherit nixGL flake-pkgs tools misc;
              };
              modules = defaultModules;
            };
          "jarkz@laptop" =
            home-manager.lib.homeManagerConfiguration {
              pkgs = pkgs;
              extraSpecialArgs = {
                username = "jarkz";
                machineSpecs = laptopSpecs;
                overlays = defaultOverlays;

                inherit nixGL flake-pkgs tools misc;
              };
              modules = defaultModules;
            };
          "jarkz@laptop-no-split-kb" =
            home-manager.lib.homeManagerConfiguration {
              pkgs = pkgs;
              extraSpecialArgs = {
                username = "jarkz";
                machineSpecs = laptopNoSplitKbSpecs;
                overlays = defaultOverlays;

                inherit nixGL flake-pkgs tools misc;
              };
              modules = defaultModules;
            };
        };
    };
}

