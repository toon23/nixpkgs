{ stdenv, buildPythonPackage, fetchPypi, future }:

buildPythonPackage rec {

  pname = "backports.csv";
  version = "1.0.7";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1277dfff73130b2e106bf3dd347adb3c5f6c4340882289d88f31240da92cbd6d";
  };

  propagatedBuildInputs = [ future ];

  meta = with stdenv.lib; {
    description = "Backport of Python 3 csv module";
    homepage = https://github.com/ryanhiebert;
    license = licenses.psfl;
  };
}
