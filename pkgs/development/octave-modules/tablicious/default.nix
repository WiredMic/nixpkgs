{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
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

  meta = {
    homepage = "https://gnu-octave.github.io/packages/tablicious/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [ KarlJoad ];
    description = "Matlab-compatible Octave table class for storing tabular/relational data. Similar to R and Python Pandas DataFrames.";
  };
}
