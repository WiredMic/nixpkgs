{
  buildOctavePackage,
  lib,
  fetchurl,
  # deps
  # biosig,
}:

buildOctavePackage rec {
  pname = "biosig";
  version = "3.9.4";

  src = fetchurl {
    url = "https://sourceforge.net/projects/biosig/files/Biosig%20for%20Octave/${pname}4octave-${version}.src.tar.gz";
    sha256 = "sha256-igixiVhWYrQPA9JzgP4N/MTFBGvf0punQCWkRRMHWCY=";
  };

  # buildInputs = [ biosig ];

  # propagatedBuildInputs = [ biosig ];

  meta = {
    homepage = "https://gnu-octave.github.io/packages/biosig/";
    license = lib.licenses.gpl3Plus;
    maintainers = [ ];
    description = " Biomedical signal processing tools.";
    # biosig needs to be packaged
    # Link to the PR
    # I have tested it and it succeed with 20/20
    # broken = true;
  };
}
