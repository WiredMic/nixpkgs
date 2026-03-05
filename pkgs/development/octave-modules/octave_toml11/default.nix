{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  # Pkg deps
  toml11,
}:

buildOctavePackage rec {
  pname = "octave_toml11";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "CNOCTAVE";
    repo = "octave_toml11";
    tag = version;
    sha256 = "sha256-i9N9rUeUmQKPKSYNrbgqgdedUmqKIZzK9LFbo0QY0a4=";
  };

  buildInputs = [
    toml11
  ];

  postPatch = ''
    chmod +x src/configure
    substituteInPlace src/toml_isa.cc \
          --replace-fail '#include <octave/oct.h>' $'#include <csignal>\n#include <octave/oct.h>'
    substituteInPlace src/toml_find_by_idx.cc \
          --replace-fail '#include <octave/oct.h>' $'#include <csignal>\n#include <octave/oct.h>'
    substituteInPlace src/toml_format.cc \
          --replace-fail '#include <octave/oct.h>' $'#include <csignal>\n#include <octave/oct.h>'
    substituteInPlace src/toml_find_by_key.cc \
          --replace-fail '#include <octave/oct.h>' $'#include <csignal>\n#include <octave/oct.h>'
  '';

  meta = {
    homepage = "https://gnu-octave.github.io/packages/octave_toml11/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [ KarlJoad ];
    description = "The octave_toml11 package provides functions for process TOML.";
  };
}
