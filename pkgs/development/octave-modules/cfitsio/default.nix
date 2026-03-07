{
  buildOctavePackage,
  lib,
  fetchFromGitHub,
  cfitsio,
}:

buildOctavePackage rec {
  pname = "cfitsio";
  version = "0.0.7";

  src = fetchFromGitHub {
    owner = "gnu-octave";
    repo = "octave-cfitsio";
    tag = "v${version}";
    sha256 = "sha256-z+l6CRIqClNw58gIIpXN7nhnE3Gf1ACTdq9JfbFfgTM=";
  };

  builtInputs = [
    cfitsio
  ];

  meta = {
    homepage = "https://gnu-octave.github.io/packages/cfitsio/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [ KarlJoad ];
    description = "I/O routines to read and write FITS (Flexible Image Transport System) files.";
    # PKG_ADD err
    # ======
    # warning: autoload: '__cfitsio__.oct' is not an absolute filename
    # warning: called from
    #     /nix/store/3w29iymyi4g6g1jaxjf5nif0dygmwz66-octave-11.1.0-env/share/octave/octave_packages/cfitsio-0.0.7/x86_64-pc-linux-gnu-api-v61/PKG_ADD at line 2 column 1
    #     doc_cache_create>gen_doc_cache_in_dir at line 146 column 5
    #     doc_cache_create at line 62 column 6
    #     install>generate_lookfor_cache at line 846 column 5
    #     install at line 241 column 7
    #     pkg at line 692 column 9
    # ======
    broken = true;
  };
}
