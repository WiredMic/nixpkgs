{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
}:

buildOctavePackage rec {
  pname = "hdf5oct";
  version = "1.1.0";

  src = fetchFromGitHub {
    owner = "gapost";
    repo = "hdf5oct";
    tag = version;
    sha256 = "sha256-zAVo8O7crlYUB/ssQTd/6fiDhVTzT+YiTA10pbAr1mQ=";
  };

  meta = {
    homepage = "https://gnu-octave.github.io/packages/hdf5oct/";
    license = lib.licenses.lgpl3;
    maintainers = with lib.maintainers; [ KarlJoad ];
    description = "MATLAB compatible high-level functions for HDF5 file I/O. ";
  };
}
