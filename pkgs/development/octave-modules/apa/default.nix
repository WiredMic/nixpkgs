{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
}:

buildOctavePackage rec {
  pname = "apa";
  version = "1.1.0";

  src = fetchFromGitHub {
    owner = "gnu-octave";
    repo = "pkg-apa";
    tag = "v${version}";
    sha256 = "sha256-Aiy1/f4RLYxKHEMI4eJgyAR8PRX8zpCo570u/pBB9gE=";
  };

  # Needs gcc at Octave build time

  meta = {
    homepage = "https://gnu-octave.github.io/packages/apa/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [ KarlJoad ];
    description = "Arbitrary Precision Arithmetic (APA) package for Octave/Matlab.";
    longDescription = ''
      Arbitrary Precision Arithmetic (APA) package for Octave/Matlab.
      This package is a wrapper around the MPFR library, which provides arbitrary precision floating-point arithmetic.
      The package allows users to perform calculations with a precision that can be set at runtime, making it suitable for applications that require high precision, such as numerical analysis and scientific computing.'';
    broken = true;
  };
}
