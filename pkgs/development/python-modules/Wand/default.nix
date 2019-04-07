{ stdenv
, buildPythonPackage
, fetchPypi
, imagemagick7Big
}:

buildPythonPackage rec {
  pname = "Wand";
  version = "0.5.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "ae7c0958509a22f531b7b97e93adfd3f1208f0ac1c593af9e5f0cffa4ac06d5b";
  };

  postPatch = ''
    substituteInPlace wand/api.py --replace \
      "magick_home = os.environ.get('MAGICK_HOME')" \
      "magick_home = '${imagemagick7Big}'"
  '';

  # tests not included with pypi release
  doCheck = false;

  passthru.imagemagick = imagemagick7Big;

  meta = with stdenv.lib; {
    description = "Ctypes-based simple MagickWand API binding for Python";
    homepage = http://wand-py.org/;
    license = [ licenses.mit ];
    maintainers = with maintainers; [ infinisil ];
  };
}
