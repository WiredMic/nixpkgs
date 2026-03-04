{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  cmake,
}:
buildOctavePackage rec {
  pname = "geographiclib";
  version = "2.5";

  src = fetchFromGitHub {
    owner = "geographiclib";
    repo = "geographiclib-octave";
    tag = "v${version}";
    sha256 = "sha256-rzVDm98FxDGdTUgszgdQVPFY69JEZ5OdYFOdEOEw/ec=";
  };

  nativeBuildInputs = [ cmake ];

  postPatch = ''
    cmake .
  '';

  meta = {
    homepage = "https://gnu-octave.github.io/packages/geographiclib/";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ KarlJoad ];
    description = "Native Octave/MATLAB implementations of a subset of the C++ library, GeographicLib";
    longDescription = ''
      Native Octave/MATLAB implementations of a subset of the C++ library, GeographicLib.
      Key components of this toolbox are:
      (a) Geodesics, direct, inverse, area calculations;
      (b) Projections, transverse Mercator, polar stereographic, etc;
      (c) Grid systems, UTM, UPS, MGRS;
      (d) Geoid lookup, egm84, egm96, egm2008 geoids supported;
      (e) Geometric transformations, geocentric, local cartesian;
      (f) Great ellipse, direct, inverse, area calculations;
      (g) Geodesics and coordinate conversions on a triaxial ellipsoid.
    '';
  };
}
