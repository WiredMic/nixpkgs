{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  # Octave deps
  io,
}:

buildOctavePackage rec {
  pname = "fileio";
  version = "1.2.3";

  src = fetchFromGitHub {
    owner = "reprostat";
    repo = "fileio";
    tag = version;
    sha256 = "sha256-pEFNUxIB+2e6Rm7k9gQ9owN7GsXQv8fpQJaeVzqjPc0=";
  };

  requiredOctavePackages = [ io ];

  meta = {
    homepage = "https://gnu-octave.github.io/packages/fileio/";
    license = lib.licenses.mit;
    maintainers = [ ];
    description = " I/O function for files holding structured data, such as JSON and XML files.";
  };
}
