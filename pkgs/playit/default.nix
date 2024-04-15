{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:
rustPlatform.buildRustPackage rec {
  pname = "playit";
  version = "0.15.13";
  doCheck = false;
  src = fetchFromGitHub {
    owner = "playit-cloud";
    repo = "playit-agent";
    rev = "dc1c82fc49a75ca044c4694838ca650fd55170c0";
    hash = "sha256-QIWqjdjsEqcjX76L+7ZWSUGKhMN0tbwX0dORUfnplhY=";
  };

  cargoHash = "sha256-61VGaVdOjwPYUaXlx4uPwPaGziA0jbfSxnSoLC7A+LA=";

  meta = {
    description = "A fast line-oriented regex search tool, similar to ag and ack";
    homepage = "https://github.com/BurntSushi/ripgrep";
    license = lib.licenses.unlicense;
    maintainers = [];
  };
}
