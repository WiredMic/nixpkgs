{
  buildOctavePackage,
  lib,
  fetchFromGitLab,
  nix-update-script,
  cmake,
  # deps
  # caosdb,
  boost, # > 1.78.0
  gtest, # > 1.11.0
}:

buildOctavePackage rec {
  pname = "caosdb";
  version = "0.2.1";

  src = fetchFromGitLab {
    owner = "linkahead";
    repo = "linkahead-octavelib";
    tag = "v${version}";
    sha256 = "sha256-RUJOCM1NP7Pa8ON4XxK7RkqYwkTwtFf1URYQXGDd8vQ=";
  };

  nativeBuildInputs = [ cmake ];

  buildInputs = [
    # caosdb
    boost
    gtest
  ];

  passthru.updateScript = nix-update-script { extraArgs = [ "--version-regex=v(.*)" ]; };

  meta = {
    homepage = "https://gnu-octave.github.io/packages/caosdb/";
    license = lib.licenses.agpl3Plus;
    maintainers = [ ];
    description = "This package contains utility functions to interact with CaosDB, the open scientific data management toolkit.";
  };
}
