{ stdenv, cmake, hellolib }:

stdenv.mkDerivation rec {
  pname = "lab2_part3_library";
  version = "0.1.0";
  src = ./hellolib;
  nativeBuildInputs = [ cmake ];
}
