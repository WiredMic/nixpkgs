{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  # Octave deps
  statistics,
  datatypes,
  io,
}:

buildOctavePackage rec {
  pname = "csg-toolkit";
  version = "1.4.3";

  src = fetchFromGitHub {
    owner = "pr0m1th3as";
    repo = "csg-toolkit";
    tag = "v${version}";
    sha256 = "sha256-O+L3S+oy2L3pokL+3iXo8lcu6vCXe+0EP0PK8mbbMMA=";
  };

  requiredOctavePackages = [
    statistics
    datatypes
    io
  ];

  meta = {
    homepage = "https://gnu-octave.github.io/packages/csg-toolkit/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [ KarlJoad ];
    description = "GNU Octave toolkit for analyzing cross-sectional geometric properties of long bones from 3D mesh models";
    longDescription = ''
      The present set of GNU Octave functions provides a novel and robust algorithm
      for analyzing the diaphyseal cross-sectional geometric properties of long bones,
      which can be applied to any 3D digital model of a humerus, ulna, femur or tibia
      bone represented as a triangular mesh in a Wavefront OBJ file format.
    '';
  };
}
