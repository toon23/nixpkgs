{ stdenv, buildPythonPackage, fetchPypi, isPy3k,
  click, jinja2, shellingham, six
}:

buildPythonPackage rec {
  pname = "click-completion";
  version = "0.5.1";
  disabled = (!isPy3k);

  src = fetchPypi {
    inherit pname version;
    sha256 = "78072eecd5e25ea0d25ceaf99cd5f22aa2667d67231ae0819deab9b1ff3456fb";
  };

  propagatedBuildInputs = [ click jinja2 shellingham six ];

  meta = with stdenv.lib; {
    description = "Add or enhance bash, fish, zsh and powershell completion in Click";
    homepage = https://github.com/click-contrib/click-completion;
    license = licenses.mit;
    maintainers = with maintainers; [ mbode ];
  };
}
