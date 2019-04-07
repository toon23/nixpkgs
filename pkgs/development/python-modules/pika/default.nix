{ stdenv
, buildPythonPackage
, fetchPypi
, isPy3k
, nose
, mock
, pyyaml
, unittest2
, pyev
, twisted
, tornado
}:

buildPythonPackage rec {
  pname = "pika";
  version = "0.13.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "b0640085f1d6398fd47bb16a17713053e26578192821ea5d928772b8e6a28789";
  };

  # Tests require twisted which is only availalble for python-2.x
  doCheck = !isPy3k;

  buildInputs = [ nose mock pyyaml unittest2 pyev ]
    ++ stdenv.lib.optionals (!isPy3k) [ twisted tornado ];

  meta = with stdenv.lib; {
    description = "Pure-Python implementation of the AMQP 0-9-1 protocol";
    homepage = https://pika.readthedocs.org;
    license = licenses.bsd3;
  };

}
