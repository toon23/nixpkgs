{ stdenv, cmake, pkgs, libmodbus, pkgconfig, fetchFromGitHub }:

stdenv.mkDerivation rec {
  name = "mbpoll-${version}";
  version = "1.4.11";

  src = fetchFromGitHub {
    owner = "epsilonrt";
    repo = "mbpoll";
    rev = "v${version}";
    sha256 = "21ed3c28f954d822df1e397301536cfb7bfd74ee4225c500d295550e686b5f5c";
  };

  buildInputs = [ libmodbus ];
  nativeBuildInputs = [ cmake pkgconfig ];

  meta = with stdenv.lib; {
    description = "command line utility to communicate with ModBus slave (RTU or TCP)";
    homepage = "https://epsilonrt.fr";
    license = licenses.cecill20;
    platforms = platforms.linux;
  };
}

