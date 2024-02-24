{
  description = "my project description";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    # nix2container generates containers in a more efficient way
    # nix2container.url = "github:nlewo/nix2container";
    # nix2container.inputs.flake-utils.follows = "flake-utils";
    # nix2container.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, flake-utils, ... }: # nix2container,
    flake-utils.lib.eachDefaultSystem
      (system:
        let pkgs = nixpkgs.legacyPackages.${system}; in
        rec {
          packages.container = pkgs.callPackage ./container.nix {
            nix-go-demo = packages.default;
          };
          packages.default = pkgs.callPackage ./default.nix { };
          devShells.default = pkgs.callPackage ./shell.nix { };
        }
      );

}

# To-Do: Enable nix2container
#     https://github.com/nlewo/nix2container?tab=readme-ov-file#getting-started
