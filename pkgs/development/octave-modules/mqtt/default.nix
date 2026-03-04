{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  nix-update-script,
  paho-mqtt-c,
}:

buildOctavePackage rec {
  pname = "mqtt";
  version = "0.0.6";

  # This tag was a mistage from upstream
  # https://github.com/gnu-octave/octave-mqtt/issues/2#event-23284957498
  src = fetchFromGitHub {
    owner = "gnu-octave";
    repo = "octave-mqtt";
    tag = "release-${version}-main";
    sha256 = "sha256-iXqCha557E966f5z8HObYgAAQD587XxNiKTYfuL48aU=";
  };

  buildInputs = [
    paho-mqtt-c
  ];

  passthru.updateScript = nix-update-script { extraArgs = [ "--version-regex=release-(.*)-main" ]; };

  meta = {
    homepage = "https://gnu-octave.github.io/packages/mqtt/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [ KarlJoad ];
    description = "Octave implementation of mqtt toolkit";
    broken = true;
  };
}
