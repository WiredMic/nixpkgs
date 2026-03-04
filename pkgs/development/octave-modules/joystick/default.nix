{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  pkg-config,
  autoconf,
  automake,
  libtool,
  # Pkg deps
  SDL2,
}:
buildOctavePackage rec {
  pname = "joystick";
  version = "0.0.4";

  src = fetchFromGitHub {
    owner = "gnu-octave";
    repo = "octave-joystick";
    tag = "v${version}";
    sha256 = "sha256-rj6NLUuFPyGRqXZgF/On7OD+iC7AAm4fD7nKz/H/tfg=";
  };

  nativeBuildInputs = [
    autoconf
    automake
    libtool
    pkg-config
  ];

  buildInputs = [ SDL2 ];
  propagatedBuildInputs = [ SDL2 ];

  # buildOctavePackage does not handle // PKG_ADD: directives during install
  # https://docs.octave.org/v6.1.0/PKG_005fADD-and-PKG_005fDEL-Directives.html#PKG_005fADD-and-PKG_005fDEL-Directives
  postPatch = ''
    # Remove Windows-only CMAKE_FIND_PACKAGE calls — this macro is
    # undefined on Linux and autoreconf leaves it verbatim as invalid bash
    sed -i '/CMAKE_FIND_PACKAGE/d' src/configure.ac

    ( cd src && autoreconf -fi )

    sed -i 's|^// PKG_ADD:|// PKG_ADD_NOAUTO:|g' src/joystick.cc src/pkglock.cc
    sed -i 's|^// PKG_DEL:|// PKG_DEL_NOAUTO:|g' src/joystick.cc src/pkglock.cc

    cp inst/PKG_ADD inst/PKG_ADD.orig
    {
      echo 'pkg_dir = fileparts(__FILE__);'
      echo 'oct_candidates = glob(fullfile(pkg_dir, "*", "__joystick__.oct"));'
      echo 'if (isempty(oct_candidates))'
      echo '  oct_candidates = glob(fullfile(pkg_dir, "__joystick__.oct"));'
      echo 'endif'
      echo 'if (!isempty(oct_candidates))'
      echo '  oct_file = oct_candidates{1};'
      echo '  autoload ("__joystick_list__",     oct_file);'
      echo '  autoload ("__joystick_axis__",     oct_file);'
      echo '  autoload ("__joystick_button__",   oct_file);'
      echo '  autoload ("__joystick_pov__",      oct_file);'
      echo '  autoload ("__joystick_force__",    oct_file);'
      echo '  autoload ("__joystick_caps__",     oct_file);'
      echo '  autoload ("__joystick_close__",    oct_file);'
      echo '  autoload ("__joystick__",          oct_file);'
      echo '  autoload ("__joystick_pkg_lock__", oct_file);'
      echo 'else'
      echo '  warning("joystick PKG_ADD: could not locate __joystick__.oct");'
      echo 'endif'
      cat inst/PKG_ADD.orig
    } > inst/PKG_ADD
  '';

  meta = {
    homepage = "https://gnu-octave.github.io/packages/joystick/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [
      KarlJoad
      WiredMic
    ];
    description = "Provides basic joystick functions for GNU Octave.";
  };
}
