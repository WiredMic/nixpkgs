{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
}:

buildOctavePackage rec {
  pname = "statistics-resampling";
  version = "5.6.0";

  src = fetchFromGitHub {
    owner = "gnu-octave";
    repo = "statistics-resampling";
    tag = version;
    sha256 = "sha256-i6R7LwGhPeamUNVYxPGPazI0rKeDrQR5B2JtyG8TfD8=";
  };

  meta = {
    homepage = "https://gnu-octave.github.io/packages/tensorflow/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [ ];
    description = "TensorFlow interface for GNU Octave.";
  };
}
