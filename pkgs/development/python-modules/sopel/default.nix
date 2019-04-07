{ stdenv
, buildPythonPackage
, fetchPypi
, pytest
, praw
, xmltodict
, pytz
, pyenchant
, pygeoip
, python
, isPyPy
, isPy27
}:

buildPythonPackage rec {
  pname = "sopel";
  version = "6.6.5";

  src = fetchPypi {
    inherit pname version;
    sha256 = "a1626086cde6a967e190bca887d8d7cf94fdcc45cae32681e8515dd4f7b92bfc";
  };

  buildInputs = [ pytest ];
  propagatedBuildInputs = [ praw xmltodict pytz pyenchant pygeoip ];

  disabled = isPyPy || isPy27;

  checkPhase = ''
    ${python.interpreter} test/*.py                                         #*/
  '';

  meta = with stdenv.lib; {
    description = "Simple and extensible IRC bot";
    homepage = "http://sopel.chat";
    license = licenses.efl20;
    maintainers = with maintainers; [ mog ];
  };

}
