{
  lib,
  rustPlatform,
  fetchFromGitHub,
  libclang,
}:

rustPlatform.buildRustPackage {
  pname = "claude-bash-hook";
  version = "0.2.1-macos.1";

  src = fetchFromGitHub {
    owner = "jeremyschlatter";
    repo = "claude-bash-hook";
    rev = "v0.2.1-macos.1";
    hash = "sha256-TxRVKUkC9e9CHkqyPe7lcWyyzauMWFf8PILnDayDguY=";
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
