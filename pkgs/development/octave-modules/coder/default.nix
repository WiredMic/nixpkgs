{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  nix-update-script,
}:

buildOctavePackage rec {
  pname = "coder";
  version = "1.11.1";

  src = fetchFromGitHub {
    owner = "shsajjadi";
    repo = "OctaveCoder";
    tag = "coder-${version}";
    sha256 = "sha256-5VmCl17RD6xDgf47i90nJG/bDpkxqgg8Ro+a0OvbWPs=";
  };

  passthru.updateScript = nix-update-script { extraArgs = [ "--version-regex=coder-(.*)" ]; };

  meta = {
    homepage = "https://gnu-octave.github.io/packages/odbc/";
    license = lib.licenses.agpl3Plus;
    maintainers = with lib.maintainers; [ KarlJoad ];
    description = "Octave function to C++ translater";
    longDescription = ''
      Coder is an Octave code generator and build system that, given a function name
      translates the function and all of its dependencies to C++ and builds a .oct shared module.
    '';
  };
}
