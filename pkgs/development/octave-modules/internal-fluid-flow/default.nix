{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  nix-update-script,
}:

buildOctavePackage rec {
  pname = "internal-fluid-flow";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "aumpierre-unb";
    repo = "Internal-Fluid-Flow-for-GNU-Octave";
    tag = "v${version}";
    sha256 = "sha256-UnGVwq3fKXTX9oIMI1gMDtUryODdnrF7hPQ0niapQDA=";
  };

  passthru.updateScript = nix-update-script { extraArgs = [ "--version-regex=v(.*)" ]; };

  meta = {
    homepage = "https://gnu-octave.github.io/packages/internal-fluid-flow/";
    license = lib.licenses.gpl3Plus;
    maintainers = [ ];
    description = "A toolbox for internal fluid flow for GNU Octave.";
  };
}
