{ buildPythonPackage
, lib
, fetchPypi
}:

buildPythonPackage rec {
  pname = "portpicker";
  version = "1.3.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "d2cdc776873635ed421315c4d22e63280042456bbfa07397817e687b142b9667";
  };

  meta = {
    description = "A library to choose unique available network ports.";
    homepage = "https://github.com/google/python_portpicker";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ danharaj ];
  };
}
