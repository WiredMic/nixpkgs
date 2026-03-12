{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  nix-update-script,
}:

buildOctavePackage rec {
  pname = "psychrometrics";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "aumpierre-unb";
    repo = "Psychrometrics-for-GNU-Octave";
    tag = "v${version}";
    sha256 = "sha256-xVEANacm0bMkZoFQ3ijkTzlntr+ylcimxws068BqkOs=";
  };

  passthru.updateScript = nix-update-script { extraArgs = [ "--version-regex=v(.*)" ]; };

  meta = {
    homepage = "https://gnu-octave.github.io/packages/psychrometrics/";
    license = lib.licenses.gpl3Plus;
    maintainers = [ ];
    description = "A toolbox for air-water vapor psychrometrics for GNU Octave.";
  };
}
