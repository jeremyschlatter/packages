{
  direnv,
}:

direnv.overrideAttrs (oldAttrs: {
  src = oldAttrs.src.override {
    rev = "63e95577b0f4c6fc3d9b23753c7d1c9e579c1773";
    hash = "sha256-7gJ6B742umSJN1taeRs1C0okilwYfeMysMRn3nIy7hA=";
  };
})
