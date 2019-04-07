{ lib, buildPythonPackage, fetchPypi,
  marshmallow, sqlalchemy
}:

buildPythonPackage rec {
  pname = "marshmallow-sqlalchemy";
  version = "0.16.1";

  meta = {
    homepage = "https://github.com/marshmallow-code/marshmallow-sqlalchemy";
    description = "SQLAlchemy integration with marshmallow ";
    license = lib.licenses.mit;
  };

  src = fetchPypi {
    inherit pname version;
    sha256 = "99c50c570b6e89ffc9f9633ce4acb63f9e1bddf36839b07b9ae0f540588d6937";
  };

  propagatedBuildInputs = [ marshmallow sqlalchemy ];

  doCheck = false;
}
