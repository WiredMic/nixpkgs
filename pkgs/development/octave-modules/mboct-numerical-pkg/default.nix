{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  mkl,
  metis,
  gtest,
  mumps,
  mboct-octave-pkg,
}:

buildOctavePackage rec {
  pname = "mboct-numerical-pkg";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "octave-user";
    repo = "mboct-numerical-pkg";
    tag = version;
    sha256 = "sha256-XSH+aHhy5BJ1l1KIVbuVQcuTdjTZnowR+eV8gmy+MpE=";
  };

  buildInputs = [
    mkl
    metis
    gtest
    mumps
  ];

  requiredOctavePackages = [
    mboct-octave-pkg
  ];

  meta = {
    homepage = "https://gnu-octave.github.io/packages/mboct-numerical-pkg/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [ KarlJoad ];
    description = "Numerical solver interfaces (MKL, METIS, MUMPS) for the mboct-* MBDyn/Octave package suite";
    longDescription = ''
      This package belongs to a suite of packages which can be used for pre- and
      postprocessing of flexible bodies in MBDyn (www.mbdyn.org) with GNU-Octave.
      It contains interfaces to several well known numerical solvers.
    '';
    # pkg test fails with PKG_ADD error
    # And mboct-numerical-pkg is dependent on broken mboct-octave-pkg
    # ======
    # warning: autoload: '__mboct_numerical__.oct' is not an absolute filename
    # warning: called from
    #     /nix/store/py2l0pfz5mz0pfl5pjbvryapldnghqrj-octave-11.1.0-env/share/octave/octave_packages/mboct-numerical-pkg-0.1.0/x86_64-pc-linux-gnu-api-v61/PKG_ADD at line 2 column 1
    #     load_packages_and_dependencies at line 62 column 5
    #     load_packages at line 53 column 3
    #     pkg at line 892 column 7
    # ======
    broken = true;
  };
}
