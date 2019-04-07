{ stdenv
, buildPythonPackage
, fetchPypi
, isPy27
, falcon
, requests
}:

buildPythonPackage rec {
  pname = "hug";
  version = "2.4.7";
  disabled = isPy27;

  src = fetchPypi {
    inherit pname version;
    sha256 = "d618bac37a27bda84e54783db16532d6a653367998f20ccb7f985e12554d8a7d";
  };

  propagatedBuildInputs = [ falcon requests ];

  # tests are not shipped in the tarball
  doCheck = false;

  meta = with stdenv.lib; {
    description = "A Python framework that makes developing APIs as simple as possible, but no simpler";
    homepage = https://github.com/timothycrosley/hug;
    license = licenses.mit;
  };

}
