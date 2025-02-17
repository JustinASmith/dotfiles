{
  description = "My Darwin system flake dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvim = {
        url = "path:.config/nvim";
        flake = false;
    };
    krewfile.url = "github:brumhard/krewfile";
    sketcybar = {
        url = "path:.config/sketchybar";
        flake = false;
    };
  };

  outputs = { self, nixpkgs, darwin, ... }@inputs:
    let
      nixpkgsConfig = {
        allowUnfree = true;
        allowUnsupportedSystem = false;
      };

      unstable = import inputs.nixpkgs-unstable { inherit system; };
      overlays = with inputs; [ krewfile.overlay ];
      user = "JustinASmith";
      hostname = "homebase";
      system = "aarch64-darwin";
    in {
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt;
      # nix-darwin for macOS
      darwinConfigurations.${hostname} = darwin.lib.darwinSystem {
        inherit system;
        # makes all inputs availble in imported files
        specialArgs = { inherit inputs; inherit unstable; };
        modules = [
          inputs.nix-index-database.darwinModules.nix-index
          ./darwin
          ({ pkgs, inputs, ... }: {
            nixpkgs.config = nixpkgsConfig;
            nixpkgs.overlays = overlays;

            system = {
              stateVersion = 4;
              configurationRevision = self.rev or self.dirtyRev or null;
            };

            users.users.${user} = {
              home = "/Users/${user}";
              shell = pkgs.zsh;
            };

            networking = {
              computerName = hostname;
              hostName = hostname;
              localHostName = hostname;
            };

            nix = {
              # enable flakes per default
              package = pkgs.nixVersions.stable;
              gc = {
                automatic = false;
                user = user;
              };
              settings = {
                allowed-users = [ user ];
                experimental-features = [ "nix-command" "flakes" ];
                warn-dirty = false;
                # produces linking issues when updating on macOS
                # https://github.com/NixOS/nix/issues/7273
                auto-optimise-store = false;
              };
            };
          })
        ];
      };
    };
}
