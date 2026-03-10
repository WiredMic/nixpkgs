{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  # deps
  lsb-release,
}:

buildOctavePackage rec {
  pname = "prompt";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "gnu-octave";
    repo = "prompt";
    tag = version;
    sha256 = "sha256-6nYQQvXL9fpd8QeodRi7BNyfMZWwNfp0SaIYmacP2F4=";
  };

  propagatedBuildInputs = [ lsb-release ];

  meta = {
    homepage = "https://gnu-octave.github.io/packages/prompt/";
    license = lib.licenses.gpl3Plus;
    maintainers = [ ];
    description = "A powerlevel10k-like prompt for octave.";
  };
}
