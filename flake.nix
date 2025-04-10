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
        version = "08.11.2024";
        run-server = pkgs.stdenv.mkDerivation rec {
          name = "run-web-server";
          src = ./.;
          unpackPhase = "true";
          buildPhase = ":";
          installPhase = ''
            mkdir -p $out/bin
            echo '#!${pkgs.python312}/bin/python3' > $out/bin/run-web-server
            echo 'import http.server' >> $out/bin/run-web-server
            echo 'import socketserver' >> $out/bin/run-web-server
            echo 'port = 8000' >> $out/bin/run-web-server
            echo 'handler = http.server.SimpleHTTPRequestHandler' >> $out/bin/run-web-server
            echo 'with socketserver.TCPServer(("", port), handler) as httpd:' >> $out/bin/run-web-server
            echo ' print(f"Server started at http://localhost:{port}/")' >> $out/bin/run-web-server
            echo ' httpd.serve_forever()' >> $out/bin/run-web-server
            chmod +x $out/bin/run-web-server
          '';
        };
      in
      with pkgs;
      {
        devShells.default = mkShell {
          buildInputs = [
            html-tidy
            nodePackages.prettier
            nodePackages.eslint
            simple-http-server
            nodePackages.npm
            w3m
          ];
        };
        packages = {
          default = run-server;
          site = stdenv.mkDerivation {
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
