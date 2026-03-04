{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  sqlite,
}:

buildOctavePackage rec {
  pname = "sqlite";
  version = "0.1.3";

  src = fetchFromGitHub {
    owner = "gnu-octave";
    repo = "octave-sqlite";
    tag = "v${version}";
    sha256 = "sha256-Ki9vJvwfdadX6YK+mw7TA5NeXofw9N1uViV1X6Fq+/A=";
  };

  buildInputs = [ sqlite ];

  meta = {
    homepage = "https://gnu-octave.github.io/packages/sqlite/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [ KarlJoad ];
    description = "Basic Octave implementation of the sqlite toolkit";
    broken = true;
  };
}
