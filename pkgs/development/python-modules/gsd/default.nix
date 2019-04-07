{ stdenv
, buildPythonPackage
, fetchPypi
, numpy
}:

buildPythonPackage rec {
  version = "1.6.1";
  pname = "gsd";

  src = fetchPypi {
    inherit pname version;
    sha256 = "4124b1433d552037a9cf8fd769be5d3584ce7e875cea4d3ab48f60bd58e12ca2";
  };

  propagatedBuildInputs = [ numpy ];

  # tests not packaged with gsd
  doCheck = false;

  meta = with stdenv.lib; {
    homepage = https://bitbucket.org/glotzer/gsd;
    description = "General simulation data file format";
    license = licenses.bsd2;
    maintainers = [ maintainers.costrouc ];
  };
}
