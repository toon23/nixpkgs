{ stdenv
, buildPythonPackage
, fetchPypi
, pytest
, virtualenv
}:

buildPythonPackage rec {
  pname = "virtualenv-clone";
  version = "0.5.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1349815ebc77b495c2346fac27d851fcd7b9f8596985bbf867f075e9fcdfe571";
  };

  buildInputs = [ pytest ];
  propagatedBuildInputs = [ virtualenv ];

  # needs tox to run the tests
  doCheck = false;

  meta = with stdenv.lib; {
    homepage = https://github.com/edwardgeorge/virtualenv-clone;
    description = "Script to clone virtualenvs";
    license = licenses.mit;
  };

}
