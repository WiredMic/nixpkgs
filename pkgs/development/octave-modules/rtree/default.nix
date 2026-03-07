{
  buildOctavePackage,
  lib,
  fetchFromGitLab,
  autoconf,
  nix-update-script,
  # deps
  jansson,
}:

buildOctavePackage rec {
  pname = "rtree";
  version = "0.8.2";

  src = fetchFromGitLab {
    owner = "jjg";
    repo = "librtree-octave";
    tag = "v${version}";
    sha256 = "sha256-6snVm5Evk2vas8thDEr05/h+HUa8ikjFtmLl/rKiEpc=";
  };

  nativeBuildInputs = [ autoconf ];

  buildInputs = [
    jansson
  ];

  propagatedBuildInputs = [
    jansson
  ];

  preBuild = ''
    ./configure
    make package

    ln -s src/pkg/versions/${pname}-${version}.tar.gz ${pname}-${version}.tar.gz
  '';

  passthru.updateScript = nix-update-script { extraArgs = [ "--version-regex=v(.*)" ]; };

  meta = {
    homepage = "https://gnu-octave.github.io/packages/rtree/";
    license = lib.licenses.mit;
    maintainers = [ ];
    description = "An Octave native extension implementing the R-tree spatial index of Guttman-Green. The code is an embedded version of librtree.";
  };
}
