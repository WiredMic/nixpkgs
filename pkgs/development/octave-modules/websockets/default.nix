{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  nix-update-script,
  # Octave Deps
  sockets,
}:

buildOctavePackage rec {
  pname = "websockets";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "gnu-octave";
    repo = "octave-websockets";
    tag = "v${version}";
    sha256 = "sha256-DsD9ZOFoF9joJFNwqfZSZpoP9cYnsa6FsRn7/9lLVDI=";
  };
  # https://github.com/gnu-octave/octave-websockets/releases/tag/v0.1.0
  requiredOctavePackages = [ sockets ];

  passthru.updateScript = nix-update-script { extraArgs = [ "--version-regex=v(.*)" ]; };

  meta = {
    homepage = "https://gnu-octave.github.io/packages/websockets/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [ KarlJoad ];
    description = "Simple implementation of the Websockets protocol for GNU Octave. ";
  };
}
