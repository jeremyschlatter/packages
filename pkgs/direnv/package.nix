{
  direnv,
  fetchpatch,
}:

direnv.overrideAttrs (oldAttrs: {
  patches = (oldAttrs.patches or [ ]) ++ [
    (fetchpatch {
      name = "error-message.patch";
      url = "https://github.com/direnv/direnv/pull/1426.patch";
      hash = "sha256-qK4wT4+jZdzLBWm5m0up/VZWiUw9kzS9FhM0NsC/DZo=";
    })
  ];
})
