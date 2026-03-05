{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  # build Deps
  cmake,
  eigen,
}:
buildOctavePackage rec {
  pname = "piqp";
  version = "0.6.2";

  src = fetchFromGitHub {
    owner = "PREDICT-EPFL";
    repo = "piqp";
    tag = "v${version}";
    sha256 = "sha256-W9t7d+wV5WcphL54e6tpnKxiWFay9UrFmIRKsGk2yMM=";
  };

  nativeBuildInputs = [
    cmake
    eigen
  ];

  preBuild = ''
    # Run cmake build
    mkdir -p build
    cmake -S . -B build \
      -DBUILD_WITH_STD_OPTIONAL=ON \
      -DBUILD_OCTAVE_INTERFACE=ON \
      -DBUILD_PYTHON_INTERFACE=OFF \
      -DBUILD_MATLAB_INTERFACE=OFF \
      -DBUILD_C_INTERFACE=OFF \
      -DBUILD_TESTS=OFF \
      -DBUILD_EXAMPLES=OFF
    cmake --build build

    # Assemble package layout
    mkdir -p pkg/inst
    cp interfaces/octave/package/CITATION    pkg/
    cp interfaces/octave/package/COPYING     pkg/
    cp interfaces/octave/package/DESCRIPTION pkg/
    cat > pkg/pre_install.m <<- 'EOF'
      function pre_install (in)
        % piqp_oct.oct is pre-compiled by Nix
      endfunction
    EOF
    cp interfaces/octave/piqp.m              pkg/inst/
    cp interfaces/octave/piqp_oct.oct        pkg/inst/

    # Create tarball that buildPhase expects
    tar --transform 's,^,${pname}-${version}/,' -cz -C pkg . -f ${pname}-${version}.tar.gz
  '';

  meta = {
    homepage = "https://gnu-octave.github.io/packages/piqp/";
    license = lib.licenses.bsd2;
    maintainers = with lib.maintainers; [ KarlJoad ];
    description = "PIQP is a Proximal Interior Point Quadratic Programming solver, which can solve dense and sparse quadratic programs.";
  };
}
