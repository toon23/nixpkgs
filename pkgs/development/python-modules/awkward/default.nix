{ lib
, buildPythonPackage
, fetchPypi
, numpy
, pytestrunner
, pytest
, h5py
}:

buildPythonPackage rec {
  pname = "awkward";
  version = "0.8.14";

  src = fetchPypi {
    inherit pname version;
    sha256 = "28c8b79fee51b9b3a0281f8ab9d1f6958d3bf5b6a8b15e5884b4ad637b6bc8d5";
  };

  nativeBuildInputs = [ pytestrunner ];
  checkInputs = [ pytest h5py ];
  propagatedBuildInputs = [ numpy ];

  checkPhase = ''
    py.test
  '';

  meta = with lib; {
    description = "Manipulate jagged, chunky, and/or bitmasked arrays as easily as Numpy";
    homepage = https://github.com/scikit-hep/awkward-array;
    license = licenses.bsd3;
    maintainers = [ maintainers.costrouc ];
  };
}
