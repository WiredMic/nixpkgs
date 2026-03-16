{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  nix-update-script,
  # deps
  mpi,
}:

buildOctavePackage rec {
  pname = "mpi";
  version = "3.1.0";

  src = fetchFromGitHub {
    owner = "carlodefalco";
    repo = "octave-mpi";
    tag = "v${version}";
    sha256 = "sha256-T5JHFLADey9BwQjKwzpCRV8fLzYmpcPe0nHZU3XSFIQ=";
  };

  buildInputs = [ mpi ];

  passthru.updateScript = nix-update-script { extraArgs = [ "--version-regex=v(.*)" ]; };

  meta = {
    homepage = "https://gnu-octave.github.io/packages/mpi/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [
      KarlJoad
      WiredMic
    ];
    description = "Octave bindings for basic Message Passing Interface (MPI) functions for parallel computing";
    # https://github.com/carlodefalco/octave-mpi/issues/7
    broken = true;
  };
}
