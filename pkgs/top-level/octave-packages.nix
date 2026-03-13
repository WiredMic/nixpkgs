# This file contains the GNU Octave add-on packages set.
# Each attribute is an Octave library.
# Expressions for the Octave libraries are supposed to be in `pkgs/development/octave-modules/<name>/default.nix`.

# When contributing a new package, if that package has a dependency on another
# octave package, then you DO NOT need to explicitly list it as such when
# performing the callPackage. It will be passed implicitly.
# In addition, try to use the same dependencies as the ones octave needs, which
# should ensure greater compatibility between Octave itself and its packages.

# Like python-packages.nix, packages from top-level.nix are not in the scope
# of the `callPackage` used for packages here. So, when we do need packages
# from outside, we can `inherit` them from `pkgs`.
{
  pkgs,
  config,
  lib,
  stdenv,
  fetchurl,
  newScope,
  octave,
}:

let
  inherit (lib)
    catAttrs
    concatLists
    filter
    makeScope
    unique
    ;
in

makeScope newScope (
  self:
  let
    callPackage = self.callPackage;

    buildOctavePackage = callPackage ../development/interpreters/octave/build-octave-package.nix {
      inherit lib stdenv;
      inherit octave;
      inherit computeRequiredOctavePackages;
    };

    # Given a list of required Octave package derivations, get a list of
    # ALL required Octave packages needed for the ones specified to run.
    computeRequiredOctavePackages =
      drvs:
      let
        # Check whether a derivation is an octave package
        hasOctavePackage = drv: drv ? isOctavePackage;
        packages = filter hasOctavePackage drvs;
      in
      unique (packages ++ concatLists (catAttrs "requiredOctavePackages" packages));

  in
  {

    inherit callPackage buildOctavePackage computeRequiredOctavePackages;

    inherit (callPackage ../development/interpreters/octave/hooks { })
      writeRequiredOctavePackagesHook
      ;

    apa = callPackage ../development/octave-modules/apa { };

    arduino = callPackage ../development/octave-modules/arduino {
      inherit (pkgs) arduino-core-unwrapped;
    };

    audio = callPackage ../development/octave-modules/audio { };

    automatic-differentiation = callPackage ../development/octave-modules/automatic-differentiation { };

    bim = callPackage ../development/octave-modules/bim { };

    bioinfo = callPackage ../development/octave-modules/bioinfo { };

    biosig = callPackage ../development/octave-modules/biosig {
      # inherit (pkgs) biosig;
    };

    bsltl = callPackage ../development/octave-modules/bsltl { };

    caosdb = callPackage ../development/octave-modules/caosdb {
      inherit (pkgs)
        # caosdb
        boost
        gtest
        ;
    };

    cfitsio = callPackage ../development/octave-modules/cfitsio {
      inherit (pkgs) cfitsio;
    };

    cgi = callPackage ../development/octave-modules/cgi { };

    chartjs = callPackage ../development/octave-modules/chartjs {
      inherit (pkgs) crow;
    };

    csg-toolkit = callPackage ../development/octave-modules/csg-toolkit { };

    coder = callPackage ../development/octave-modules/coder { };

    communications = callPackage ../development/octave-modules/communications { };

    control = callPackage ../development/octave-modules/control { };

    data-smoothing = callPackage ../development/octave-modules/data-smoothing { };

    database = callPackage ../development/octave-modules/database { };

    dataframe = callPackage ../development/octave-modules/dataframe { };

    datatypes = callPackage ../development/octave-modules/datatypes { };

    dicom = callPackage ../development/octave-modules/dicom { };

    divand = callPackage ../development/octave-modules/divand { };

    doctest = callPackage ../development/octave-modules/doctest { };

    econometrics = callPackage ../development/octave-modules/econometrics { };
    femoctave = callPackage ../development/octave-modules/femoctave {
      # inherit (pkgs) triangle;
    };

    fileio = callPackage ../development/octave-modules/fileio { };

    fits = callPackage ../development/octave-modules/fits { };

    financial = callPackage ../development/octave-modules/financial { };

    fpl = callPackage ../development/octave-modules/fpl { };

    fuzzy-logic-toolkit = callPackage ../development/octave-modules/fuzzy-logic-toolkit { };

    fxp = callPackage ../development/octave-modules/fxp { };

    ga = callPackage ../development/octave-modules/ga { };

    general = callPackage ../development/octave-modules/general {
      nettle = pkgs.nettle;
    };

    generate_html = callPackage ../development/octave-modules/generate_html { };

    geographiclib = callPackage ../development/octave-modules/geographiclib {
      inherit (pkgs) cmake;
    };

    geometry = callPackage ../development/octave-modules/geometry { };

    gsl = callPackage ../development/octave-modules/gsl {
      inherit (pkgs) gsl;
    };

    hdf5oct = callPackage ../development/octave-modules/hdf5oct { };

    image = callPackage ../development/octave-modules/image { };

    image-acquisition = callPackage ../development/octave-modules/image-acquisition { };

    instrument-control = callPackage ../development/octave-modules/instrument-control { };

    io = callPackage ../development/octave-modules/io {
      inherit (octave) enableJava;
    };

    internal-fluid-flow = callPackage ../development/octave-modules/internal-fluid-flow { };

    interval = callPackage ../development/octave-modules/interval { };

    joystick = callPackage ../development/octave-modules/joystick {
      inherit (pkgs) SDL;
    };

    linear-algebra = callPackage ../development/octave-modules/linear-algebra { };

    llms = callPackage ../development/octave-modules/llms { };

    lssa = callPackage ../development/octave-modules/lssa { };

    ltfat = callPackage ../development/octave-modules/ltfat {
      inherit (octave)
        fftw
        fftwSinglePrec
        portaudio
        jdk
        ;
      inherit (pkgs) fftwFloat fftwLongDouble;
    };

    mapping = callPackage ../development/octave-modules/mapping { };

    matgeom = callPackage ../development/octave-modules/matgeom { };

    mboct-fem-pkg = callPackage ../development/octave-modules/mboct-fem-pkg {
      inherit (pkgs)
        mkl
        metis
        gtest
        mumps
        nlopt
        ;
    };

    mboct-mbdyn-pkg = callPackage ../development/octave-modules/mboct-mbdyn-pkg {
      inherit (pkgs)
        mkl
        metis
        gtest
        mumps
        ;
    };

    mboct-numerical-pkg = callPackage ../development/octave-modules/mboct-numerical-pkg {
      inherit (pkgs)
        mkl
        metis
        gtest
        mumps
        ;
    };

    mboct-octave-pkg = callPackage ../development/octave-modules/mboct-octave-pkg {
      inherit (pkgs) gtest;
    };

    mccabe-thiele = callPackage ../development/octave-modules/mccabe-thiele { };

    miscellaneous = callPackage ../development/octave-modules/miscellaneous { };

    molsim = callPackage ../development/octave-modules/molsim { };

    mqtt = callPackage ../development/octave-modules/mqtt {
      inherit (pkgs) paho-mqtt-c;
    };

    msh = callPackage ../development/octave-modules/msh {
      # PLACEHOLDER until KarlJoad gets dolfin packaged.
      dolfin = null;
    };

    mvn = callPackage ../development/octave-modules/mvn { };

    nan = callPackage ../development/octave-modules/nan { };

    ncarray = callPackage ../development/octave-modules/ncarray { };

    netcdf = callPackage ../development/octave-modules/netcdf {
      inherit (pkgs) netcdf;
    };

    nurbs = callPackage ../development/octave-modules/nurbs { };

    odbc = callPackage ../development/octave-modules/odbc { };

    ocl = callPackage ../development/octave-modules/ocl { };

    octave_mermaid_js = callPackage ../development/octave-modules/octave_mermaid_js {
      inherit (octave) python;
    };

    octave-pool = callPackage ../development/octave-modules/octave-pool { };

    octave_toml11 = callPackage ../development/octave-modules/octave_toml11 {
      inherit (pkgs) toml11;
    };

    octclip = callPackage ../development/octave-modules/octclip { };

    octproj = callPackage ../development/octave-modules/octproj { };

    optics = callPackage ../development/octave-modules/optics { };

    optim = callPackage ../development/octave-modules/optim { };

    optiminterp = callPackage ../development/octave-modules/optiminterp { };

    pde1dm = callPackage ../development/octave-modules/pde1dm { };

    piqp = callPackage ../development/octave-modules/piqp { };

    pkg-octave-doc = callPackage ../development/octave-modules/pkg-octave-doc {
      inherit (pkgs) texi2html;
    };

    ponchon-savarit = callPackage ../development/octave-modules/ponchon-savarit { };

    prompt = callPackage ../development/octave-modules/prompt {
      inherit (pkgs) lsb-release;
    };

    psychrometrics = callPackage ../development/octave-modules/psychrometrics { };

    pythonic = callPackage ../development/octave-modules/pythonic {
      inherit (octave) python;
    };

    quaternion = callPackage ../development/octave-modules/quaternion { };

    queueing = callPackage ../development/octave-modules/queueing { };

    raspi = callPackage ../development/octave-modules/raspi { };

    rtree = callPackage ../development/octave-modules/rtree {
      inherit (pkgs) jansson;
    };

    signal = callPackage ../development/octave-modules/signal { };

    sockets = callPackage ../development/octave-modules/sockets { };

    sole = callPackage ../development/octave-modules/sole { };

    splines = callPackage ../development/octave-modules/splines { };

    statistics = callPackage ../development/octave-modules/statistics { };

    statistics-resampling = callPackage ../development/octave-modules/statistics-resampling { };

    stk = callPackage ../development/octave-modules/stk { };

    strings = callPackage ../development/octave-modules/strings { };

    struct = callPackage ../development/octave-modules/struct { };

    symbolic = callPackage ../development/octave-modules/symbolic {
      inherit (octave) python;
    };

    sqlite = callPackage ../development/octave-modules/sqlite {
      inherit (pkgs) sqlite;
    };

    tablicious = callPackage ../development/octave-modules/tablicious { };

    tensorflow = callPackage ../development/octave-modules/tensorflow {
      inherit (pkgs) libtensorflow;
    };

    timer = callPackage ../development/octave-modules/timer { };

    tsa = callPackage ../development/octave-modules/tsa { };

    velas = callPackage ../development/octave-modules/velas { };

    video = callPackage ../development/octave-modules/video { };

    windows = callPackage ../development/octave-modules/windows { };

    zeromq = callPackage ../development/octave-modules/zeromq {
      inherit (pkgs) zeromq autoreconfHook;
    };

  }
  // lib.optionalAttrs config.allowAliases {
    fem-fenics = throw "octavePackages.fem-fenics has been removed due to being broken for more than a year; see RFC 180"; # Added 2026-02-05
    level-set = throw "octavePackages.level-set has been removed due to being broken for more than a year; see RFC 180"; # Added 2026-02-05
    parallel = throw "octavePackages.parallel has been removed due to being broken for more than a year; see RFC 180"; # Added 2026-02-05
    sparsersb = throw "octavePackages.sparsersb has been removed due to being broken for more than a year; see RFC 180"; # Added 2026-02-05
    tisean = throw "octavePackages.tisean has been removed due to being broken for more than a year; see RFC 180"; # Added 2026-02-05
    vibes = throw "octavePackages.vibes has been removed due to being broken for more than a year; see RFC 180"; # Added 2026-02-05
    vrml = throw "octavePackages.vrml has been removed due to being broken for more than a year; see RFC 180"; # Added 2026-02-05
  }
)
