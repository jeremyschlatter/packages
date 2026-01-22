{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule {
  pname = "opcli";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "jeremyschlatter";
    repo = "opcli";
    rev = "main";
    hash = "sha256-I+02Ze5RSzfHDqOCp0UjDp+DgS29+TQpnMuqcE7eg+c=";
  };

  vendorHash = "sha256-rI2NVwv6GHue1NpRPVDvH6Tp5bx+p76HBpCkCQjgeQU=";

  meta = with lib; {
    description = "Fast 1Password CLI - 23x faster than official op CLI";
    homepage = "https://github.com/jeremyschlatter/opcli";
    license = licenses.mit;
    mainProgram = "opcli";
  };
}
