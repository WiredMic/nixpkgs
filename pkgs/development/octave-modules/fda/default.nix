{
  buildOctavePackage,
  lib,
  fetchFromGitLab,
  nix-update-script,
}:

buildOctavePackage rec {
  pname = "fda";
  version = "1.0.0";

  src = fetchFromGitLab {
    owner = "kakila";
    repo = "fda";
    tag = "v${version}";
    sha256 = "sha256-AWeErNpAWn/ESRc5mC6IYUeg1wI6rRdpS7fUzFQbAP4=";
  };

  passthru.updateScript = nix-update-script { extraArgs = [ "--version-regex=v(.*)" ]; };

  meta = {
    homepage = "https://gnu-octave.github.io/packages/fda/";
    license = lib.licenses.agpl3Plus;
    maintainers = with lib.maintainers; [
      KarlJoad
      WiredMic
    ];
    description = "Functional Data Analysis";
  };
}
