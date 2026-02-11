{
  lib,
  rustPlatform,
  fetchFromGitHub,
  stdenv,
  libclang,
}:

rustPlatform.buildRustPackage {
  pname = "claude-bash-hook";
  version = "0.2.1-unstable-2025-07-11";

  src = fetchFromGitHub {
    owner = "Osso";
    repo = "claude-bash-hook";
    rev = "8484a66772fdf78c215f4cb34556911f4d692220";
    hash = "sha256-FJgpT6sltEdedZYtmCNJeVnZXD11G8ID8F60eJHFlkU=";
  };

  cargoHash = "sha256-LrTRAGQVsR2CBygOrBM29MyxUDduW7lDlCOv5uDfWJg=";

  LIBCLANG_PATH = "${libclang.lib}/lib";

  # Tests rely on /tmp paths that don't work in the Nix sandbox
  doCheck = false;

  postPatch = lib.optionalString stdenv.hostPlatform.isDarwin ''
    sed -i '/^systemd-journal-logger/d' Cargo.toml
    sed -i '/Initialize journald/d; /systemd_journal_logger/,/^    \}/d' src/main.rs
  '';

  meta = {
    description = "Claude Code PreToolUse hook for fine-grained bash command permissions";
    homepage = "https://github.com/Osso/claude-bash-hook";
    license = lib.licenses.mit;
    mainProgram = "claude-bash-hook";
  };
}
