{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
}:

buildOctavePackage rec {
  pname = "velas";
  version = "1.0.6";

  src = fetchFromGitHub {
    owner = "ranzhengcode";
    repo = "VELAS";
    tag = "v${version}";
    sha256 = "sha256-ROhsCddQ1gZfa5R8iDbaZZbxSzbg8IZmFNy/taDrM/w=";
  };

  meta = {
    homepage = "https://gnu-octave.github.io/packages/velas/";
    license = lib.licenses.gpl3Plus;
    maintainers = [ ];
    description = "VELAS is a user-friendly open-source toolbox for the visualization and analysis of elastic anisotropy written in GNU Octave that can be used for any crystal symmetry. ";
    longDescription = ''
      VELAS is a user-friendly open-source toolbox for the visualization and
      analysis of elastic anisotropy written in GNU Octave that can be used
      for any crystal symmetry.

      Note: the GUI (velasGUI) requires Octave to be built with Qt support:
        (octave.override { enableQt = true; }).withPackages (p: [ p.velas ])
    '';
  };
}
