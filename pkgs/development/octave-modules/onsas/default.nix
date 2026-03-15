{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  nix-update-script,
  # deps
}:

buildOctavePackage rec {
  pname = "onsas";
  version = "0.4.4";

  src = fetchFromGitHub {
    owner = "ONSAS";
    repo = "ONSAS";
    tag = "v${version}";
    sha256 = "sha256-HEYgabUsooP4Swo+MSxclMjs1G/O70Tua4lnoicxvF8=";
  };

  postPatch = ''
    mv src inst
  '';

  dontWrapQtApps = true;

  passthru.updateScript = nix-update-script { extraArgs = [ "--version-regex=v(.*)" ]; };

  meta = {
    homepage = "https://gnu-octave.github.io/packages/onsas/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [
      KarlJoad
      WiredMic
    ];
    description = "ONSAS is an Open Nonlinear Structural Analysis Solver.";
  };
}
