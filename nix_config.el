(require 's)

;; Some ol bullshit i have to do because dmenu won't launch emacs with NIX_PATH
(unless (getenv "NIX_PATH")
  (setenv "NIX_PATH" (s-concat "nixpkgs=" (getenv "HOME") "/.nix-defexpr/channels/nixpkgs")))
