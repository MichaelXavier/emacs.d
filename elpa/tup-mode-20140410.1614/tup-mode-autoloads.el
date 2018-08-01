;;; tup-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "tup-mode" "tup-mode.el" (0 0 0 0))
;;; Generated autoloads from tup-mode.el

(autoload 'tup-mode "tup-mode" "\
Major mode for editing tupfiles for the Tup build system.

\\{tup-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.tup$" . tup-mode))

(add-to-list 'auto-mode-alist '("Tupfile" . tup-mode))

(add-to-list 'auto-mode-alist '("tup.config" . tup-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tup-mode" '("tup")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; tup-mode-autoloads.el ends here
