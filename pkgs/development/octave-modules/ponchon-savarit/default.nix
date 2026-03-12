{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  nix-update-script,
}:

buildOctavePackage rec {
  pname = "ponchon-savarit";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "aumpierre-unb";
    repo = "Ponchon-Savarit-for-GNU-Octave";
    tag = "v${version}";
    sha256 = "sha256-OotKdRYattgX02GRfHlfpLuKIa62LAHTs2D7YryesMA=";
  };

  passthru.updateScript = nix-update-script { extraArgs = [ "--version-regex=v(.*)" ]; };

  meta = {
    homepage = "https://gnu-octave.github.io/packages/ponchon-savarit/";
    license = lib.licenses.gpl3Plus;
    maintainers = [ ];
    description = "A toolbox for the Ponchón-Savarit method for GNU Octave.";
  };
}
