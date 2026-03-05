{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  gtest,
}:

buildOctavePackage rec {
  pname = "mboct-octave-pkg";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "octave-user";
    repo = "mboct-octave-pkg";
    tag = version;
    sha256 = "sha256-kBnohWuoiP2IT9L03yimDZwONyWeV1oBCzL8/lhK5Ss=";
  };

  buildInputs = [ gtest ];

  meta = {
    homepage = "https://gnu-octave.github.io/packages/mboct-octave-pkg/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [ KarlJoad ];
    description = "General purpose utilities shared across the mboct-* MBDyn/Octave package suite";
    longDescription = ''
      This package belongs to a suite of packages which can be used for pre- and
      postprocessing of flexible bodies in MBDyn (www.mbdyn.org) with GNU-Octave.
      It contains general purpose utility functions used in all mboct-* packages
    '';
    # pkg test fails with PKG_ADD error
    # ======
    # warning: autoload: '__mboct_octave_proc__.oct' is not an absolute filename
    # warning: called from
    # /nix/store/3wssqszbc9gd2ydvsba2wlcn5nd6rnyd-octave-11.1.0-env/share/octave/octave_packages/mboct-octave-pkg-0.1.0/x86_64-pc-linux-gnu-api-v61/PKG_ADD at line 2 column 1
    # load_packages_and_dependencies at line 62 column 5
    # load_packages at line 53 column 3
    # pkg at line 892 column 7
    # ======
    broken = true;
  };
}
