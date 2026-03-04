{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  # Pkg deps
  tzdata,
}:

buildOctavePackage rec {
  pname = "tablicious";
  version = "0.4.7";

  src = fetchFromGitHub {
    owner = "apjanke";
    repo = "octave-tablicious";
    tag = "v${version}";
    sha256 = "sha256-YzHXHY46VP0CLNXgl8vwuOsXr04uDGEU38Tb/Uu+dLE=";
  };

  postPatch = ''
    substituteInPlace inst/+tblish/+internal/+chrono/+tzinfo/TzDb.m \
      --replace-fail "/usr/share/zoneinfo" "${tzdata}/share/zoneinfo"
  '';

  meta = {
    homepage = "https://gnu-octave.github.io/packages/tablicious/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [
      KarlJoad
      WiredMic
    ];
    description = "Matlab-compatible Octave table class for storing tabular/relational data. Similar to R and Python Pandas DataFrames.";
  };
}
