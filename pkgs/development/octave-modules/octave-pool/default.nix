{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  # deps
  fileio,
}:

buildOctavePackage rec {
  pname = "octave-pool";
  version = "1.2.3";

  src = fetchFromGitHub {
    owner = "reprostat";
    repo = "octave-pool";
    tag = version;
    sha256 = "sha256-PdQFiLFQaXFZYioQaRWCSSLDOxXp6IUALT6lBbYxVS4=";
  };

  requiredOctavePackages = [
    fileio
  ];

  # https://github.com/reprostat/octave-pool/issues/1
  # https://github.com/reprostat/octave-pool/issues/2
  doCheck = false;

  meta = {
    homepage = "https://gnu-octave.github.io/packages/octave-pool/";
    license = lib.licenses.mit;
    maintainers = [ ];
    description = "Parallel computing with independent job submission for Octave.";
  };
}
