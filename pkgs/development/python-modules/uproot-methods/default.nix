{ stdenv
, buildPythonPackage
, fetchPypi
, numpy
, awkward
}:

buildPythonPackage rec {
  version = "0.4.6";
  pname = "uproot-methods";

  src = fetchPypi {
    inherit pname version;
    sha256 = "fb5b9ebb60571d9af12b027eb54b249433b5ee0b4b525b02d118a226968f1090";
  };

  propagatedBuildInputs = [ numpy awkward ];

  meta = with stdenv.lib; {
    homepage = https://github.com/scikit-hep/uproot-methods;
    description = "Pythonic mix-ins for ROOT classes";
    license = licenses.bsd3;
    maintainers = [ maintainers.costrouc ];
  };
}
