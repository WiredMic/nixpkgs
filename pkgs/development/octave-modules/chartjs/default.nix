{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  # deps
  crow,
}:

buildOctavePackage rec {
  pname = "chartjs";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "pr0m1th3as";
    repo = "octave-chartjs";
    tag = "release-${version}";
    sha256 = "sha256-BrS9oYAEtg4E+jlpBRbTU06tLACGCK1QoRxV900ITOI=";
  };

  buildInputs = [
    crow
  ];

  postPatch = ''
    substituteInPlace src/__webserve__.cc \
      --replace-fail '#include "crow_all.h"' '#include "${crow}/include/crow.h"'
  '';

  meta = {
    homepage = "https://gnu-octave.github.io/packages/femoctave/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [ ];
    description = "Use FEM for solving boundary value problems in two space dimensions.";
  };
}
