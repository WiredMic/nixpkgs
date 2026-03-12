{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  nix-update-script,
}:

buildOctavePackage rec {
  pname = "mccabe-thiele";
  version = "0.1.5";

  src = fetchFromGitHub {
    owner = "aumpierre-unb";
    repo = "McCabe-Thiele-for-GNU-Octave";
    tag = "v${version}";
    sha256 = "sha256-qe2hoh3WQZPgUAorECxEdGsn6Cu/7W2jkxD2gTea/ko=";
  };

  passthru.updateScript = nix-update-script { extraArgs = [ "--version-regex=v(.*)" ]; };

  meta = {
    homepage = "https://gnu-octave.github.io/packages/mccabe-thiele/";
    license = lib.licenses.gpl3Plus;
    maintainers = [ ];
    description = " A toolbox for the McCabe-Thiele method for GNU Octave.";
  };
}
