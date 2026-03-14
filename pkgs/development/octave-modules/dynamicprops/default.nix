{
  buildOctavePackage,
  lib,
  fetchFromGitLab,
  nix-update-script,
}:

buildOctavePackage rec {
  pname = "dynamicprops";
  version = "0.1";

  src = fetchFromGitLab {
    owner = "farhi";
    repo = "octave-dynamicprops";
    tag = "${version}";
    sha256 = "sha256-K2+TN4lFMYg5Aj4m/qjO+TuheLqDvynL22Q3V1IP8Nk=";
  };

  passthru.updateScript = nix-update-script { extraArgs = [ "--version-regex=(.*)" ]; };

  meta = {
    homepage = "https://gnu-octave.github.io/packages/dynamicprops/";
    license = lib.licenses.gpl2Plus;
    maintainers = with lib.maintainers; [ KarlJoad ];
    description = "Matlab-compatible superclass allowing to add new properties dynamically";
  };
}
