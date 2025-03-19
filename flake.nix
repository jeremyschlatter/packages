{
  description = "My personal nix repository";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      systems,
      treefmt-nix,
    }:
    let
      eachSystem = f: nixpkgs.lib.genAttrs (import systems) (system: f nixpkgs.legacyPackages.${system});
      treefmt =
        pkgs:
        treefmt-nix.lib.evalModule pkgs {
          programs.nixfmt.enable = true;
        };
    in
    {
      packages = eachSystem (
        pkgs:
        pkgs.lib.mapAttrs (name: _: pkgs.callPackage ./pkgs/${name}/package.nix { }) (
          builtins.readDir ./pkgs
        )
      );
      formatter = eachSystem (pkgs: (treefmt pkgs).config.build.wrapper);
      checks = eachSystem (pkgs: {
        formatting = (treefmt pkgs).config.build.check self;
      });
    };
}
