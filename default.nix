{ stdenv, cmake }:

stdenv.mkDerivation rec {
  pname = "HelloLibrary";
  version = "0.1.0";
  src = ./.;
  nativeBuildInputs = [ cmake ];
}
