{
  lib,
  stdenv,
  fetchFromGitHub,
  installShellFiles,
  makeWrapper,
  libpcap,
}:
stdenv.mkDerivation rec {
  pname = "masscan-mc";
  version = "d415038c386801068e727b5d151e4ce2453c4d36";

  src = fetchFromGitHub {
    owner = "adrian154";
    repo = "masscan";
    rev = version;
    sha256 = "sha256-6goyTi2QWMSSoKpFCD4I5cPMJu+srUr+nOM3GSADEyE=";
  };

  /*
     patches = [
    # Patches the missing "--resume" functionality
    (fetchpatch {
      name = "resume.patch";
      url = "https://github.com/robertdavidgraham/masscan/commit/90791550bbdfac8905917a109ed74024161f14b3.patch";
      sha256 = "sha256-A7Fk3MBNxaad69MrUYg7fdMG77wba5iESDTIRigYslw=";
    })
  ];
  */

  postPatch = lib.optionalString stdenv.isDarwin ''
    # Fix broken install command
    substituteInPlace Makefile --replace "-pm755" "-pDm755"
  '';

  nativeBuildInputs = [makeWrapper installShellFiles];

  makeFlags = [
    "PREFIX=$(out)"
    "GITVER=${version}"
    "CC=${stdenv.cc.targetPrefix}cc"
  ];

  enableParallelBuilding = true;

  postInstall = ''
    installManPage doc/masscan.?

    install -Dm444 -t $out/etc/masscan            data/exclude.conf
    install -Dm444 -t $out/share/doc/masscan      doc/*.{html,js,md}
    install -Dm444 -t $out/share/licenses/masscan LICENSE

    wrapProgram $out/bin/masscan \
      --prefix LD_LIBRARY_PATH : "${libpcap}/lib"
  '';

  doInstallCheck = true;

  installCheckPhase = ''
    $out/bin/masscan --selftest
  '';

  meta = with lib; {
    description = "Fast scan of the Internet";
    mainProgram = "masscan";
    homepage = "https://github.com/robertdavidgraham/masscan";
    changelog = "https://github.com/robertdavidgraham/masscan/releases/tag/${version}";
    license = licenses.agpl3Only;
    platforms = platforms.unix;
    maintainers = with maintainers; [rnhmjoj];
  };
}
