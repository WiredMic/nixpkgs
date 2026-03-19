{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  nix-update-script,
  # Pkg deps
  php,
}:

buildOctavePackage rec {
  pname = "octave_php_wrapper";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "CNOCTAVE";
    repo = "octave_php_wrapper";
    tag = "${version}";
    sha256 = "sha256-45U+Y1ynT9hVOAmNLjH1qiRiSUDPtLVs1RfaBQEKiqQ=";
  };

  buildInputs = [ php ];

  passthru.updateScript = nix-update-script { extraArgs = [ "--version-regex=(.*)" ]; };

  meta = {
    homepage = "https://gnu-octave.github.io/packages/octave_php_wrapper/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [
      KarlJoad
      WiredMic
    ];
    description = "The octave_php_wrapper package creates a PHP wrapper for Octave script, so that you can run the Octave script by PHP, like modern Internet service.";
  };
}
