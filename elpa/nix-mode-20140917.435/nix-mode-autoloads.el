;;; nix-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (nix-mode) "nix-mode" "nix-mode.el" (21590 59364
;;;;;;  914796 610000))
;;; Generated autoloads from nix-mode.el

(autoload 'nix-mode "nix-mode" "\
Major mode for editing Nix expressions.

The following commands may be useful:

  '\\[newline-and-indent]'
    Insert a newline and move the cursor to align with the previous
    non-empty line.

  '\\[fill-paragraph]'
    Refill a paragraph so that all lines are at most `fill-column'
    lines long.  This should do the right thing for comments beginning
    with `#'.  However, this command doesn't work properly yet if the
    comment is adjacent to code (i.e., no intervening empty lines).
    In that case, select the text to be refilled and use
    `\\[fill-region]' instead.

The hook `nix-mode-hook' is run when Nix mode is started.

\\{nix-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))

(add-to-list 'auto-mode-alist '("\\.nix.in\\'" . nix-mode))

;;;***

;;;### (autoloads nil nil ("nix-mode-pkg.el") (21590 59364 934393
;;;;;;  622000))

;;;***

(provide 'nix-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; nix-mode-autoloads.el ends here
