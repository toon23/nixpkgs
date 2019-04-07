{ stdenv
, buildPythonPackage
, fetchPypi
, requests
, dateutil
, pytz
, six
}:

buildPythonPackage rec {
  pname = "influxdb";
  version = "5.2.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "afeff28953a91b4ea1aebf9b5b8258a4488d0e49e2471db15ea43fd2c8533143";
  };

  # ImportError: No module named tests
  doCheck = false;
  propagatedBuildInputs = [ requests dateutil pytz six ];

  meta = with stdenv.lib; {
    description = "Python client for InfluxDB";
    homepage = https://github.com/influxdb/influxdb-python;
    license = licenses.mit;
  };

}
