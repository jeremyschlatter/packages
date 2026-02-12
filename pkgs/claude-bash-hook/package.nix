{
  lib,
  rustPlatform,
  fetchFromGitHub,
  libclang,
}:

rustPlatform.buildRustPackage {
  pname = "claude-bash-hook";
  version = "0.2.1-macos.2";

  src = fetchFromGitHub {
    owner = "jeremyschlatter";
    repo = "claude-bash-hook";
    rev = "0fac1d8";
    hash = "sha256-SsQmln0qfjPLU5kHA0pw1ifnmkDXxWIWpUT9io+TcSA=";
  };

  cargoHash = "sha256-LrTRAGQVsR2CBygOrBM29MyxUDduW7lDlCOv5uDfWJg=";

  LIBCLANG_PATH = "${libclang.lib}/lib";

  meta = {
    description = "Claude Code PreToolUse hook for fine-grained bash command permissions";
    homepage = "https://github.com/Osso/claude-bash-hook";
    license = lib.licenses.mit;
    mainProgram = "claude-bash-hook";
  };
}
