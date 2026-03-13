{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  nix-update-script,
}:

buildOctavePackage rec {
  pname = "pde1dm";
  version = "1.3";

  src = fetchFromGitHub {
    owner = "wgreene310";
    repo = "pde1dm";
    tag = "v${version}";
    sha256 = "sha256-Q2FHykq0QHpCt30dH4FAHhIqH/D2VWpJEt9tbcSGWR4=";
  };

  # They changed to ASCII upstream
  # https://github.com/wgreene310/pde1dm/commit/164583ef2f61915f41ba575868187b4277bd5b38
  patches = ./multiprod.m.patch;

  passthru.updateScript = nix-update-script { extraArgs = [ "--version-regex=v(.*)" ]; };

  meta = {
    homepage = "https://gnu-octave.github.io/packages/pde1dm/";
    license = lib.licenses.gpl3Plus;
    maintainers = [ ];
    description = "Solve systems of partial differential equations (PDE) in a single spatial variable and time.";
  };
}
