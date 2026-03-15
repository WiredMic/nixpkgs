{
  buildOctavePackage,
  lib,
  fetchFromGitLab,
  nix-update-script,
}:

buildOctavePackage rec {
  pname = "hgsetget";
  version = "0.1";

  src = fetchFromGitLab {
    owner = "farhi";
    repo = "octave-hgsetget";
    tag = "${version}";
    sha256 = "sha256-OrKTXFGWRUeSCQgIFdNRC9BCaQBo9s7aiuv5q2MkRT8=";
  };

  passthru.updateScript = nix-update-script { extraArgs = [ "--version-regex=(.*)" ]; };

  meta = {
    homepage = "https://gnu-octave.github.io/packages/hgsetget/";
    license = lib.licenses.gpl2Plus;
    maintainers = with lib.maintainers; [
      KarlJoad
      WiredMic
    ];
    description = "Matlab-compatible superclass used to derive handle class with set and get methods";
  };
}
