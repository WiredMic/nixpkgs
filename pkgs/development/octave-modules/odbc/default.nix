{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
}:

buildOctavePackage rec {
  pname = "odbc";
  version = "0.0.6";

  src = fetchFromGitHub {
    owner = "gnu-octave";
    repo = "octave-odbc";
    tag = "v${version}";
    sha256 = "sha256-8tAMugBn4vK1w62fLDnnJS1uyxsAHinxwfTQk+vc6M0=";
  };

  meta = {
    homepage = "https://gnu-octave.github.io/packages/odbc/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [ KarlJoad ];
    description = "Basic Octave implementation of the ODBC toolkit";
    broken = true;
  };
}
