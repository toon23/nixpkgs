{ stdenv, buildPythonPackage, fetchPypi
, itsdangerous, hypothesis
, pytest, requests, glibcLocales }:

buildPythonPackage rec {
  pname = "Werkzeug";
  version = "0.15.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0a73e8bb2ff2feecfc5d56e6f458f5b99290ef34f565ffb2665801ff7de6af7a";
  };

  propagatedBuildInputs = [ itsdangerous ];
  checkInputs = [ pytest requests hypothesis ];

  checkPhase = ''
    pytest ${stdenv.lib.optionalString stdenv.isDarwin "-k 'not test_get_machine_id'"}
  '';

  meta = with stdenv.lib; {
    homepage = http://werkzeug.pocoo.org/;
    description = "A WSGI utility library for Python";
    license = licenses.bsd3;
  };
}
