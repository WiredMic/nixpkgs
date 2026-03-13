{
  buildOctavePackage,
  lib,
  fetchurl,
  # Octave Deps
  instrument-control,
}:

buildOctavePackage rec {
  pname = "raspi";
  version = "0.0.3";

  src = fetchurl {
    url = "https://sourceforge.net/projects/octave-raspberrypi/files/v${version}/${pname}-${version}.tar.gz";
    sha256 = "sha256-snN0yTydf0JIuAKMN3VhccE8MXqeBee5p7Biz94caD8=";
  };

  requiredOctavePackages = [
    instrument-control
  ];

  # Tests require a live Raspberry Pi connection (resolvehost to raspberrypi.local)
  doCheck = false;

  meta = {
    homepage = "https://gnu-octave.github.io/packages/raspi/";
    license = lib.licenses.gpl3Plus;
    maintainers = [ ];
    description = "Basic Octave implementation of the matlab raspi extension, allowing communication to a Raspberry Pi board to control its hardware.";
  };
}
