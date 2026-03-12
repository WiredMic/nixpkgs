{
  buildOctavePackage,
  lib,
  fetchurl,
  # deps
  bim,
}:

buildOctavePackage rec {
  pname = "sole";
  version = "0.1.1";

  src = fetchurl {
    url = "mirror://sourceforge/sole/${pname}-${version}.tar.gz";
    sha256 = "sha256-5LUkZORuDxWpWJ/FgEfgJFL7fmdpDX34ar3kUQ7+ssc=";
  };

  requiredOctavePackages = [
    bim
  ];

  meta = {
    homepage = "https://gnu-octave.github.io/packages/sole/";
    license = with lib.licenses; [ gpl2Plus ];
    maintainers = [ ];
    description = " A package for transient and steady state simulation of organic solar cells. ";
  };
}
