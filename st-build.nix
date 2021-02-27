with import <nixpkgs> {};

stdenv.mkDerivation rec {
    name = "st";
    version = "0.99";
    src = /home/agl/github/st;
    nativeBuildInputs = [ pkgconfig ];
    buildInputs = [ xorg.libX11 ncurses xorg.libXext xorg.libXft fontconfig ];
    installPhase = ''
        TERMINFO=$out/share/terminfo make install PREFIX=$out
        '';
}
