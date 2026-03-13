{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  nix-update-script,
}:

buildOctavePackage rec {
  pname = "bioinfo";
  version = "0.2.1";

  src = fetchFromGitHub {
    owner = "schloegl";
    repo = "octmat-bioinfo";
    tag = "bioinfo-${version}";
    sha256 = "sha256-Vy7W88ryTRj0tFw+QlOEDBmgqMli648Qs/Vjzo8+67M=";
  };

  # This is fixed upsteam
  # https://github.com/schloegl/octmat-bioinfo/issues/1
  patches = ./aminolookup.m.patch;

  passthru.updateScript = nix-update-script { extraArgs = [ "--version-regex=bioinfo-(.*)" ]; };

  meta = {
    homepage = "https://gnu-octave.github.io/packages/bioinfo/";
    license = lib.licenses.gpl3Plus;
    maintainers = [ ];
    description = " Bioinformatics tools.";
  };
}
