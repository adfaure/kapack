{ stdenv, pythonPackages, procset }:

pythonPackages.buildPythonPackage rec {
    pname = "pybatsim";
    version = "2.1.1";

    src = pythonPackages.fetchPypi {
      inherit pname version;
      sha256 = "0awm4yamfqpmd5mb85xsrz1ip56pam1rrn0w9m87lr7viq9vmcip";
    };

    buildInputs = with pythonPackages; [
      autopep8
      coverage
      ipdb
    ];
    propagatedBuildInputs = with pythonPackages; [
      sortedcontainers
      pyzmq
      redis
      click
      pandas
      docopt
      procset
    ];

    doCheck = false;

    meta = with stdenv.lib; {
      description = "Python API and Schedulers for Batsim";
      homepage = "https://gitlab.inria.fr/batsim/pybatsim";
      platforms = platforms.unix;
      license = licenses.lgpl3;
      broken = false;

      longDescription = "PyBatsim is the Python API for Batsim.";
    };
}
