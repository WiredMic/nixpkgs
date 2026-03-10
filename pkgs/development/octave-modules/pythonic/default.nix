{
  buildOctavePackage,
  lib,
  fetchFromGitLab,
  nix-update-script,
  writeText,
  # Octave's Python (Python 3)
  python,
}:

let
  pythonEnv = python.withPackages (
    ps: with ps; [
    ]
  );

in
buildOctavePackage rec {
  pname = "pythonic";
  version = "0.1.3";

  src = fetchFromGitLab {
    owner = "gnu-octave";
    repo = "octave-pythonic";
    tag = "v${version}";
    sha256 = "sha256-7OUny4UYO5t9Gy8dbXuNVRAX9i9I/0uRLI8aerTOc/8=";
  };

  propagatedBuildInputs = [ pythonEnv ];

  passthru.updateScript = nix-update-script { extraArgs = [ "--version-regex=v(.*)" ]; };

  meta = {
    homepage = "https://gnu-octave.github.io/packages/pythonic/";
    license = lib.licenses.gpl3Plus;
    maintainers = [ ];
    description = "The Pythonic package provides a Python language binding for Octave, to allow any Python package to be loaded and used directly, with automatic translation from Octave to Python data types.";
    # Needs access to PYTHONHOME
    broken = true;
  };
}
