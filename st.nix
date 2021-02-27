with import <nixpkgs> {};

stdenv.mkDerivation rec {
    name = "st";
    version = "0.99";
    src = fetchFromGitHub {
	owner = "pacordova";
	repo = "st";
	rev = "9e4d29c2c4ecb2cc8ac02673145e49ac54c97f5e";
        sha256 = "0zdhgzwvw948pp2v3vx8dkr7jypyhlr8hyfr1apgi2gajbkjhp18";
    };
    nativeBuildInputs = [ pkgconfig ];
    buildInputs = [ xorg.libX11 ncurses xorg.libXext xorg.libXft fontconfig ];
    installPhase = ''
        TERMINFO=$out/share/terminfo make install PREFIX=$out
        '';
}
