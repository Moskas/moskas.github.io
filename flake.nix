{
  description = "Basic Nix flake for css and html";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
        version = "09.04.2024";
      in
      with pkgs;
      {
        devShells.default = mkShell {
          buildInputs = [
            html-tidy
            nodePackages.prettier
          ];
        };
        packages = {
          default = stdenv.mkDerivation {
            name = "moskas.github.io";
            inherit version;
            src = ./.;
            buildPhase = ''
              mkdir -p $out
            '';
            installPhase = ''
              cp -rv $src/* $out
            '';
          };
          posts = stdenv.mkDerivation {
            name = "moskas.github.io/posts";
            inherit version;
            src = ./POSTS;
            buildPhase = ''
              mkdir -p $out
            '';
            installPhase = ''
              cp -rv $src/* $out
            '';
          };
        };
      }
    );
}
