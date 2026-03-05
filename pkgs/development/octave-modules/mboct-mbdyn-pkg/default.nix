{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  # Octave deps
  mboct-octave-pkg,
  mboct-numerical-pkg,
  # pkgs deps
  mkl,
  metis,
  gtest,
  mumps,
}:

buildOctavePackage rec {
  pname = "mboct-mbdyn-pkg";
  version = "0.1.1";

  src = fetchFromGitHub {
    owner = "octave-user";
    repo = "mboct-mbdyn-pkg";
    tag = version;
    sha256 = "sha256-NTxca5CHoT4bYWoe8mIzeb4Eu6ss1uu/NC8+Vjcsi9I=";
  };

  buildInputs = [
    mkl
    metis
    gtest
    mumps
  ];

  requiredOctavePackages = [
    mboct-octave-pkg
    mboct-numerical-pkg
  ];

  meta = {
    homepage = "https://gnu-octave.github.io/packages/mboct-mbdyn-pkg/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [ KarlJoad ];
    description = "Multibody dynamics interfaces for the mboct-* MBDyn/Octave package suite";
    longDescription = ''
      This package belongs to a suite of packages which can be used for pre- and
      postprocessing of flexible bodies in MBDyn (www.mbdyn.org) with GNU-Octave.
      It contains interfaces to the multibody dynamics software MBDyn (www.mbdyn.org).
    '';
    # Boken because of broken deps
    # mboct-octave-pkg
    # mboct-numerical-pkg
    broken = true;
  };
}
