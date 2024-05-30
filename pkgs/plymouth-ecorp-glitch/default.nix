{
  lib,
  stdenv,
  fetchFromGitHub,
  unstableGitUpdater,
}:
stdenv.mkDerivation {
  name = "plymouth-ecorp-glitch";
  version = "1.0";

  src = fetchFromGitHub {
    repo = "plymouth-themes";
    owner = "hrshbh";
    rev = "0bdfe0da437d6c001a31b280bc212b5c0dd3ef67";
    hash = "sha256-UT+OOf8hmrpl9/ZI+g42ifPb4INVzOyY9kC+FL2twF8=";
  };

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/plymouth/themes/
    cp -r $src/ecorp-glitch $out/share/plymouth/themes/
    runHook postInstall
  '';

  passthru.updateScript = unstableGitUpdater {};

  meta = with lib; {
    description = "Master hacker theme";
    homepage = "https://github.com/hrshbh/plymouth-themes";
    license = licenses.gpl3;
    maintainers = with maintainers; [lilyinstarlight];
    platforms = platforms.all;
  };
}
