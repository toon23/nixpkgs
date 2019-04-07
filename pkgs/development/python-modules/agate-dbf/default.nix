{ stdenv, fetchPypi, buildPythonPackage, agate, dbf, dbfread }:

buildPythonPackage rec {
    pname = "agate-dbf";
    version = "0.2.1";

    propagatedBuildInputs = [ agate dbf dbfread ];

    src = fetchPypi {
      inherit pname version;
      sha256 = "00c93c498ec9a04cc587bf63dd7340e67e2541f0df4c9a7259d7cb3dd4ce372f";
    };

    meta = with stdenv.lib; {
      description = "Adds read support for dbf files to agate";
      homepage    = https://github.com/wireservice/agate-dbf;
      license     = with licenses; [ mit ];
      maintainers = with maintainers; [ vrthra ];
    };
}
