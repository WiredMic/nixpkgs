{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  nix-update-script,
}:

buildOctavePackage rec {
  pname = "automatic-differentiation";
  version = "1.0.1";

  src = fetchFromGitHub {
    owner = "StevenWaldrip";
    repo = "automatic-differentiation";
    tag = "${version}";
    sha256 = "sha256-O9v8iJNY6frbHy7eehu1qf4UJucawtixp6qnwoxJZpI=";
  };

  passthru.updateScript = nix-update-script { extraArgs = [ "--version-regex=(.*)" ]; };

  meta = {
    homepage = "https://gnu-octave.github.io/packages/automatic-differentiation/";
    license = lib.licenses.gpl3Plus;
    maintainers = [ ];
    description = "Automatic-Differentiation for Octave.";
  };
}
