{ lib
, buildPythonPackage
, jupyterhub
, globus-sdk
, mwoauth
, codecov
, flake8
, pyjwt
, pytest
, pytestcov
, pytest-tornado
, requests-mock
, pythonOlder
, fetchPypi
}:

buildPythonPackage rec {
  pname = "oauthenticator";
  version = "0.8.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "f174c7b2fa20028717aa10e778f66ffa896a2fbcb2ee8a78b135d5aa8a5d56ff";
  };

  checkPhase = ''
    py.test oauthenticator/tests
  '';

  # No tests in archive
  doCheck = false;
   
  checkInputs = [  globus-sdk mwoauth codecov flake8 pytest
    pytestcov pytest-tornado requests-mock pyjwt ];
  
  propagatedBuildInputs = [ jupyterhub ];

  disabled = pythonOlder "3.4";

  meta = with lib; {
    description = "Authenticate JupyterHub users with common OAuth providers, including GitHub, Bitbucket, and more.";
    homepage =  https://github.com/jupyterhub/oauthenticator;
    license = licenses.bsd3;
    maintainers = with maintainers; [ ixxie ];
  };
}
