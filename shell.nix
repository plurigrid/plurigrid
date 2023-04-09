{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # texlive.combined.scheme-full
    # idris2
    # agda
    # ghc
    # cargo
    just
    python3
    poetry
    tree
    sl
    jq
    stdenv.cc.cc.lib
  ];
  shellHook = ''
    LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath [ pkgs.stdenv.cc.cc.lib ]};
    echo "gm gm"
  '';
}
