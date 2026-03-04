{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  SDL,
}:
buildOctavePackage rec {
  pname = "joystick";
  version = "0.0.4";

  src = fetchFromGitHub {
    owner = "gnu-octave";
    repo = "octave-joystick";
    tag = "v${version}";
    sha256 = "sha256-rj6NLUuFPyGRqXZgF/On7OD+iC7AAm4fD7nKz/H/tfg=";
  };

  propergateBuildInputs = [
    SDL
  ];

  meta = {
    homepage = "https://gnu-octave.github.io/packages/joystick/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [ KarlJoad ];
    description = "Provides basic joystick functions for GNU Octave.";
    # The PKG_ADD Problem
    broken = true;
  };
}
