{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  # pkg deps
  gmp,
  mpfr,
}:

buildOctavePackage rec {
  pname = "apa";
  version = "1.1.1";

  src = fetchFromGitHub {
    owner = "gnu-octave";
    repo = "pkg-apa";
    tag = "v${version}";
    sha256 = "sha256-NnsMPt3c3cbbt2g2MjeQ0IsP/oaXakN440yFOCNLnFw=";
  };

  buildInputs = [
    gmp
    mpfr
  ];

  # Remove test for a file in the wrong place
  # Remove tests for gmp and mpfr doing install time
  postPatch = ''
    substituteInPlace inst/install_apa.m \
      --replace-fail \
        "if (strcmp (cmd, 'rebuild') || exist (['mex_apa_interface.', mexext()], 'file') ~= 3)" \
        "if (strcmp (cmd, 'rebuild'))"
    substituteInPlace inst/install_apa.m \
      --replace-fail \
        "disp ('APA is ready to use.');" \
        "disp ('APA is ready to use.'); return;"
  '';

  meta = {
    homepage = "https://gnu-octave.github.io/packages/apa/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [
      KarlJoad
      WiredMic
    ];
    description = "Arbitrary Precision Arithmetic (APA) package for Octave/Matlab.";
    longDescription = ''
      Arbitrary Precision Arithmetic (APA) package for Octave/Matlab.
      This package is a wrapper around the MPFR library, which provides arbitrary precision floating-point arithmetic.
      The package allows users to perform calculations with a precision that can be set at runtime, making it suitable for applications that require high precision, such as numerical analysis and scientific computing.'';
  };
}
