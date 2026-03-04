{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  stdenv,
}:

buildOctavePackage rec {
  pname = "llms";
  version = "0.1.4";

  src = fetchFromGitHub {
    owner = "pr0m1th3as";
    repo = "octave-llms";
    tag = "release-${version}";
    hash = "sha256-Qn81e6rJ+2aYe7StxFppKdMSl2L1THJFV8bmqLmujxc=";
  };

  postPatch =
    if stdenv.hostPlatform.isx86 then
      ''
        substituteInPlace src/Makefile \
          --replace-fail "-march=native" "-msse4.1 -mpclmul"
      ''
    else
      ''
        substituteInPlace src/Makefile \
          --replace-fail "-march=native" "-DFPNG_NO_SSE=1"
      '';

  buildInputs = [
    stdenv.cc
  ];

  meta = {
    homepage = "https://packages.octave.org/llms/";
    license = with lib.licenses; [ gpl3Plus ];
    maintainers = with lib.maintainers; [
      KarlJoad
      WiredMic
    ];
    description = "Large Language Models for GNU Octave.";
    longDescription = ''
      Provides an interface to an Ollama server for LLM inference from GNU Octave.
      Requires a running Ollama server (see pkgs.ollama) accessible over the network.
    '';
  };
}
