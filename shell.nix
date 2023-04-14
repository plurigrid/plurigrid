{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    just
    python3
    poetry
    tree
    sl
    jq
    stdenv.cc.cc.lib
    libcxx
  ];
  shellHook = ''
    export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath [ pkgs.stdenv.cc.cc.lib ]};
    echo "gm gm"
  '';
}
