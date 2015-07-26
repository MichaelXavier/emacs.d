;;; hindent-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "hindent" "hindent.el" (21937 2859 598007 809000))
;;; Generated autoloads from hindent.el

(autoload 'hindent/reformat-decl "hindent" "\
Re-format the current declaration by parsing and pretty
  printing it. Comments are preserved, although placement may be
  funky.

\(fn)" t nil)

(autoload 'hindent-mode "hindent" "\
Indent code with the hindent program.

Provide the following keybindings:

\\{hindent-mode-map}

\(fn &optional ARG)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; hindent-autoloads.el ends here
