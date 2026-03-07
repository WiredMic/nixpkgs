{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
}:

buildOctavePackage rec {
  pname = "molsim";
  version = "1.0.1";

  src = fetchFromGitHub {
    owner = "jesperschmidthansen";
    repo = "molsim";
    tag = "v${version}";
    sha256 = "sha256-4viYqxef0WxU4V+IAILWV86o8l3fZ1/1cmG9b0mMS08=";
  };

  postPatch = ''
    substituteInPlace src/molsim.c \
      --replace-fail \
        "mxCreateNumericArray(1, &nuau," \
        "mxCreateNumericArray(1, (mwSize *)&nuau,"
  '';

  meta = {
    homepage = "https://gnu-octave.github.io/packages/molsim/";
    license = lib.licenses.gpl3Plus;
    maintainers = [ ];
    description = "molsim is a wrapper for the seplib molecular dynamics library.";
    longDescription = ''
      molsim is a wrapper for the seplib molecular dynamics library.
      It allows you to perform molecular simulations of simple atomistic systems, confined fluids, molecular mixtures, polymers and more.
    '';
  };
}
