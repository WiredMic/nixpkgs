{
  buildOctavePackage,
  lib,
  fetchFromGitLab,
}:

buildOctavePackage rec {
  pname = "timer";
  version = "0.1.2";

  src = fetchFromGitLab {
    owner = "farhi";
    repo = "octave-timer";
    tag = version;
    sha256 = "sha256-YXLK9NQT6f+Su7jtAQVMVltPDd2ZmUZIxH15hGvsl9w=";
  };

  meta = {
    homepage = "https://gnu-octave.github.io/packages/timer/";
    license = lib.licenses.gpl2Plus;
    maintainers = [ ];
    description = "A Matlab-compatible timer class to execute periodic actions.";
  };
}
