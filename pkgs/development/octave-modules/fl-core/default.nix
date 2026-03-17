{
  buildOctavePackage,
  lib,
  fetchurl,
}:

buildOctavePackage rec {
  pname = "fl-core";
  version = "1.0.2";

  src = fetchurl {
    url = "mirror://sourceforge/octave/${pname}-${version}.tar.gz";
    sha256 = "sha256-Oei3P/KdHo0Rxbr8Q2wBghxw4Kb/sfiQYXbI4Jd1Hlk=";
  };

  meta = {
    homepage = "https://gnu-octave.github.io/packages/fl-core/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [
      KarlJoad
      WiredMic
    ];
    description = "Basic functions in Fuzzy Logic";
  };
}
