{ lib
, python3
, fetchPypi
}:

python3.pkgs.buildPythonApplication rec {
  pname = "mdns-publisher";
  version = "0.9.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-sjCQKnsFR6w3IwCvZ1GDw0VqnLjEbO3ecgKOJrSZj84=";
  };

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  pythonImportsCheck = [ "mdns_publisher" ];

  meta = with lib; {
    description = "Publish CNAMEs pointing to the local host over Avahi/mDNS";
    homepage = "https://pypi.org/project/mdns-publisher/";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    mainProgram = "mdns-publisher";
  };
}
