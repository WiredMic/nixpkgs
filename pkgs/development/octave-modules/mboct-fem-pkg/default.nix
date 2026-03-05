{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  # Octave deps
  mboct-octave-pkg,
  mboct-numerical-pkg,
  mboct-mbdyn-pkg,
  # pkgs deps
  mkl,
  metis,
  gtest,
  mumps,
  nlopt,
}:

buildOctavePackage rec {
  pname = "mboct-fem-pkg";
  version = "0.2.2";

  src = fetchFromGitHub {
    owner = "octave-user";
    repo = "mboct-fem-pkg";
    tag = version;
    sha256 = "sha256-UsEw+7zEkJqXUjZsxfp473TM+KUMnN+zQTf4go00flY=";
  };

  buildInputs = [
    mkl
    metis
    gtest
    mumps
    nlopt
  ];

  requiredOctavePackages = [
    mboct-octave-pkg
    mboct-numerical-pkg
    mboct-mbdyn-pkg
  ];

  meta = {
    homepage = "https://gnu-octave.github.io/packages/mboct-fem-pkg/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [ KarlJoad ];
    description = "Structural Finite Element toolkit for linear statics and dynamics for the mboct-* MBDyn/Octave package suite";
    longDescription = ''
      This package belongs to a suite of packages which can be used for pre- and
      postprocessing of flexible bodies in MBDyn (www.mbdyn.org) with GNU-Octave.
      It contains a general purpose structural Finite Element toolkit for linear statics
      and dynamics, which can be used to generate flexible body data for MBDyn's modal
      element and also hydrodynamic lubricated journal and slider plain bearings.
    '';
    # Boken because of broken deps
    # mboct-octave-pkg
    # mboct-numerical-pkg
    # It is also broken with the PKG_ADD
    # ======
    # warning: autoload: '__mboct_fem_pkg__.oct' is not an absolute filename
    # warning: called from
    #     /nix/store/9d43jjx4giq7jpwdxmrzhgl2290k2p17-octave-11.1.0-env/share/octave/octave_packages/mboct-fem-pkg-0.2.2/PKG_ADD at line 69 column 1
    #     load_packages_and_dependencies at line 62 column 5
    #     load_packages at line 53 column 3
    #     pkg at line 892 column 7
    # ======
    broken = true;
  };
}
