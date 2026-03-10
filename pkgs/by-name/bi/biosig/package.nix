{
  lib,
  stdenv,
  fetchurl,
  # deps
  autoconf,
  gawk,
  tinyxml,
  libb64,
  dcmtk,
  suitesparse,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "biosig";
  version = "3.9.4";

  src = fetchurl {
    url = "https://sourceforge.net/projects/biosig/files/BioSig%20for%20C_C%2B%2B/src/${finalAttrs.pname}-${finalAttrs.version}.src.tar.xz";
    sha256 = "sha256-2Z5TVQDxERgCBMl4K68TKIpunPEpNyNmZsm+BDZOMqU=";
  };

  nativeBuildInputs = [
    autoconf
    gawk
  ];

  buildInputs = [
    tinyxml
    libb64
    dcmtk
    suitesparse
  ];

  # Needed to compile 'libbiosig.a', that is needed by 'install_libbiosig.a'
  dontDisableStatic = true;

  meta = {
    homepage = "https://biosig.sourceforge.net/";
    license = lib.licenses.gpl3Plus;
    maintainers = [ ];
    description = "BioSig is an open source software library for biomedical signal processing, featuring for example the analysis of biosignals such as the electroencephalogram (EEG), electrocorticogram (ECoG), electrocardiogram (ECG), electrooculogram (EOG), electromyogram (EMG), respiration, and so on.";
  };
})
