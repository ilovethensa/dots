{
  lib,
  stdenv,
  fetchFromGitHub,
  unstableGitUpdater,
}:
stdenv.mkDerivation {
  name = "plymouth-anonymous";
  version = "1.0";

  src = fetchFromGitHub {
    repo = "plymouth-anonymous";
    owner = "offensive-hub";
    rev = "05ed8eb8415f993bcc0f4e5b4ca6b5f5c2329049";
    hash = "sha256-aF4Ro5z4G6LS40ENwFDH8CgV7ldfhzqekuSph/DMQoo=";
  };

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/plymouth/themes/anon
    cp -r $src/anon $out/share/plymouth/themes/
    runHook postInstall
  '';

  passthru.updateScript = unstableGitUpdater {};

  meta = with lib; {
    description = "Anonymous plymouth theme";
    homepage = "https://github.com/offensive-hub/plymouth-anonymous";
    license = licenses.mit;
    maintainers = with maintainers; [lilyinstarlight];
    platforms = platforms.all;
  };
}
