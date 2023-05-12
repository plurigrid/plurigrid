{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    just
    poetry
    tree
    python3
    sl
    jq
    stdenv.cc.cc.lib
    libcxx

    rustc
    cargo
    pkgconfig
    libiconv
  ] ++ (lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.OpenGL
    darwin.apple_sdk.frameworks.CoreServices
    darwin.apple_sdk.frameworks.AppKit
    darwin.apple_sdk.frameworks.Foundation
    darwin.apple_sdk.frameworks.QuartzCore
    darwin.apple_sdk.frameworks.ApplicationServices
    darwin.apple_sdk.frameworks.CoreGraphics
    darwin.apple_sdk.frameworks.CoreVideo
    darwin.apple_sdk.frameworks.CoreFoundation
  ]);

  shellHook = ''
    export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath [ pkgs.stdenv.cc.cc.lib ]};
    echo "gm gm"
  '';
}
