{ lib
, buildPythonPackage
, fetchPypi
, appdirs
, dask
, holoviews
, jinja2
, msgpack-numpy
, msgpack-python
, numpy
, pandas
, python-snappy
, requests
, ruamel_yaml
, six
, tornado
, pytest
, pythonOlder
, isPy27
}:

buildPythonPackage rec {
  pname = "intake";
  version = "0.4.3";
  disabled = isPy27;

  src = fetchPypi {
    inherit pname version;
    sha256 = "80862f41d5410a4237f9b2138cacc62240f75f925a233f986c1df10a541c6f99";
  };

  checkInputs = [ pytest ];
  propagatedBuildInputs = [
    appdirs
    dask
    holoviews
    jinja2
    msgpack-numpy
    msgpack-python
    numpy
    pandas
    python-snappy
    requests
    ruamel_yaml
    six
    tornado
  ];

  checkPhase = ''
    # single test assumes python for executable name
    PATH=$out/bin:$PATH HOME=$(mktemp -d) pytest --ignore=intake/catalog/tests/test_default.py
  '';

  meta = with lib; {
    description = "Data load and catalog system";
    homepage = https://github.com/ContinuumIO/intake;
    license = licenses.bsd2;
    maintainers = [ maintainers.costrouc ];
  };
}
