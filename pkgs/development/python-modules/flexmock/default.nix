{ lib
, buildPythonPackage
, fetchPypi
, pytest
}:

buildPythonPackage rec {
  pname = "flexmock";
  version = "0.10.4";

  src = fetchPypi {
    inherit pname version;
    sha256 = "5033ceb974d6452cf8716c2ff5059074b77e546df5c849fb44a53f98dfe0d82c";
  };

  checkInputs = [ pytest ];
  checkPhase = ''
    py.test
  '';

  meta = with lib; {
    description = "flexmock is a testing library for Python that makes it easy to create mocks,stubs and fakes.";
    homepage = http://flexmock.readthedocs.org;
    license = licenses.bsdOriginal;
  };
}