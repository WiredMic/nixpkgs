{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
}:

buildOctavePackage rec {
  pname = "fileio";
  version = "1.2.2";

  src = fetchFromGitHub {
    owner = "reprostat";
    repo = "fileio";
    tag = version;
    sha256 = "sha256-Cy8ePSa4fEIkl4HDr7oIBzScZRJ3AZunZHNsCImpTao=";
  };

  meta = {
    homepage = "https://gnu-octave.github.io/packages/fileio/";
    license = lib.licenses.mit;
    maintainers = [ ];
    description = " I/O function for files holding structured data, such as JSON and XML files.";
  };
}
