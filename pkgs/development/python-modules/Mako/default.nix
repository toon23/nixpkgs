{ lib
, buildPythonPackage
, fetchPypi
, markupsafe
, nose
, mock
, pytest_3
, isPyPy
}:

buildPythonPackage rec {
  pname = "Mako";
  version = "1.0.8";

  src = fetchPypi {
    inherit pname version;
    sha256 = "04092940c0df49b01f43daea4f5adcecd0e50ef6a4b222be5ac003d5d84b2843";
  };

  checkInputs = [ markupsafe nose mock pytest_3 ];
  propagatedBuildInputs = [ markupsafe ];

  doCheck = !isPyPy;  # https://bitbucket.org/zzzeek/mako/issue/238/2-tests-failed-on-pypy-24-25

  meta = {
    description = "Super-fast templating language";
    homepage = http://www.makotemplates.org;
    license = lib.licenses.mit;
    platforms = lib.platforms.unix;
    maintainers = with lib.maintainers; [ domenkozar ];
  };
}
