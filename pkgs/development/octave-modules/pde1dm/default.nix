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

  passthru.updateScript = nix-update-script { extraArgs = [ "--version-regex=v(.*)" ]; };

  meta = {
    homepage = "https://gnu-octave.github.io/packages/pde1dm/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [
      KarlJoad
      WiredMic
    ];
    description = "Solve systems of partial differential equations (PDE) in a single spatial variable and time.";
    # https://github.com/wgreene310/pde1dm/issues/11
    # v1.3 is broken. However, the current git version works
    broken = true;
  };
}
