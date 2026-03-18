{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  # Octave deps
  # csg-toolkit, # >= 1.4.1 Optional
  statistics, # >=1.7.4
  datatypes, # >=1.0.1
}:

buildOctavePackage rec {
  pname = "csg-dataset";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "pr0m1th3as";
    repo = "csg-dataset";
    tag = "v${version}";
    sha256 = "sha256-WJZjzQRxj5zvEyvm8jjfcHEOSwpzXi7Pa3j4Xh933+M=";
  };

  requiredOctavePackages = [
    statistics
    datatypes
  ];

  meta = {
    homepage = "https://gnu-octave.github.io/packages/csg-toolkit/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [
      KarlJoad
      WiredMic
    ];
    description = "A large dataset of diaphyseal cross sectional geometric properties and relevant measurements from human long bones.";
  };
}
