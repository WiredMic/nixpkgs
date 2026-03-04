{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  # Must be version 1.82
  texi2html,
}:

buildOctavePackage rec {
  pname = "pkg-octave-doc";
  version = "0.6.9";

  src = fetchFromGitHub {
    owner = "gnu-octave";
    repo = "pkg-octave-doc";
    tag = "release-${version}";
    sha256 = "sha256-3xEQs8L1L2K+ueqF4ItTsFI+ugfvp8AjNdcS0XzxvPM=";
  };

  propagatedBuildInputs = [
    texi2html
  ];

  meta = {
    homepage = "https://gnu-octave.github.io/packages/pkg-octave-doc/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [ KarlJoad ];
    description = "Octave Package Documentation ";
    # texi2html v1.82 is not in nixpkgs and is long dead
    # either package texi2html v1.82 or wait until it is removed from upstream
    # https://github.com/gnu-octave/pkg-octave-doc/issues/15
    broken = true;
  };
}
