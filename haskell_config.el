;; haskell mode configuration
(require 'f)
(require 'haskell-session)
(require 'haskell-mode)
(require 'haskell)
(require 'smartparens)
(require 'shm)
(require 'shm-case-split)
(require 'hindent)

(eval-after-load "haskell-mode"
  '(progn
     (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
     (define-key haskell-mode-map (kbd "C-c C-;") 'haskell-process-reload-file)
     (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
     (define-key haskell-mode-map (kbd "C-c C-f") 'haskell-mode-stylish-buffer)
     (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
     (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
     (define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
     (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)
     (define-key haskell-mode-map (kbd "C-,") 'haskell-move-nested-left)
     (define-key haskell-mode-map (kbd "C-.") 'haskell-move-nested-right)
     (define-key haskell-mode-map (kbd "C-c C-d") 'haskell-w3m-open-haddock)
     ;; normally bound to haskell-mode-jump-to-def-or-tag but that
     ;; seems like a buggier find-tag that requires an active session
     (define-key haskell-mode-map (kbd "M-.") 'find-tag)
     ))

;; structured-haskell-mode keybindings
(define-key shm-map (kbd "C-w") 'shm/backward-kill-word)


(custom-theme-set-faces
 'ample-zen
 '(shm-current-face ((t (:background "#315057"))))
 '(shm-quarantine-face ((t (:background "#794544"))))
 )

(custom-theme-set-faces
 'ample-light
 '(shm-current-face ((t (:background "#8CE5FA"))))
 '(shm-quarantine-face ((t (:background "#FF918F"))))
 )


(add-hook 'haskell-mode-hook 'subword-mode)
(add-hook 'haskell-cabal-mode-hook 'subword-mode)
;; (add-hook 'haskell-mode-hook 'turn-on-hi2)
(add-hook 'haskell-mode-hook 'structured-haskell-mode)

(define-key haskell-mode-map [f8] 'haskell-navigate-imports)

;; use a template when starting a new module
(add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)

;; Don't recenter the REPL on every command
(add-hook 'haskell-interactive-mode-hook (lambda ()
                                           (set (make-local-variable 'scroll-conservatively) 100)))

(defun hackage-doc (&optional pkg)
  "Open browser pointing to hackage for the given pkg. Opens hackage if pkg not specified."
  (interactive (list
                (read-string (format "Package (%s): " (thing-at-point 'word))
                             nil nil (thing-at-point 'word))))
  (browse-url (concat "http://hackage.haskell.org/package/" pkg)))

(defalias 'hd 'hackage-doc)
(defalias 'hpr 'haskell-process-restart)

(defun browse-local-hackage-doc (pkg)
  "Find the given package name in your local cabal sandbox"
  (browse-url (f-join (sandbox-doc-root) pkg "html" "index.html")))

(defun sandbox-doc-root ()
  "Find the docs directory for the current sandbox"
  (let*
      ((session       (haskell-session))
       (cabal-dir     (haskell-session-cabal-dir session))
       (doc-root      (f-join cabal-dir ".cabal-sandbox" "share" "doc"))
       (arch-name     (car (f-directories doc-root))))
    (f-join doc-root arch-name)))

(defun list-sandbox-docs ()
  "List package docs for the current sandbox for auto completion"
  (mapcar 'f-filename (f-directories (sandbox-doc-root))))


(defun local-hackage-doc (&optional pkg)
  "Open browser pointing to hackage for the given local pkg from the sandbox."
  (interactive "P")
  (browse-local-hackage-doc
   (funcall 'ido-completing-read "Package name: "
            (list-sandbox-docs))))

(defalias 'lhd 'local-hackage-doc)


;; In keeping with soostone style guide
(add-hook 'haskell-mode-hook
          '(lambda () (column-marker-1 78)))


(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))

;; So smartparens doesn't get confused at language pragmas
(sp-local-pair 'haskell-mode "{-#" "#-}")


(setq haskell-auto-insert-module-format-string
      "module %s\n    ( \n    ) where")
