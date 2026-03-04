{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
}:

buildOctavePackage rec {
  pname = "fxp";
  version = "1.0.1";

  src = fetchFromGitHub {
    owner = "ahmedshahein";
    repo = "pkg-fxp";
    tag = version;
    hash = "sha256-bi9GapdPURqoca2RPw3/549/jUdLjEqDQ6QwNmp6vHM=";
  };

  meta = {
    homepage = "https://gnu-octave.github.io/packages/fxp/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [ KarlJoad ];
    description = "Lightweight fixed-point numeric type for GNU Octave.";
    longDesctiption = ''
      Lightweight fixed-point numeric type for GNU Octave.
      Intended for fixed-point modeling, algorithm validation, and education.
      Supports signed and unsigned formats, quantization, overflow handling, and basic arithmetic operations.
    '';
  };
}
