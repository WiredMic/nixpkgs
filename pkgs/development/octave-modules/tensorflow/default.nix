{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  # Pkg deps
  libtensorflow,
}:

buildOctavePackage rec {
  pname = "tensorflow";
  version = "0.1.1";

  src = fetchFromGitHub {
    owner = "pr0m1th3as";
    repo = "tensorflow";
    tag = "release-${version}";
    sha256 = "sha256-e+EMT3B37wAllTn0Aj4wMPMrCFZviNbhi/D8PTDtVM4=";
  };

  buildInputs = [ libtensorflow ];

  meta = {
    homepage = "https://gnu-octave.github.io/packages/tensorflow/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [ ];
    description = "TensorFlow interface for GNU Octave.";
    # Not test libtensorflow is broken
    broken = true;
  };
}
