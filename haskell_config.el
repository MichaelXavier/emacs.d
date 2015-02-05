;; haskell mode configuration
(require 'f)
(require 'ghc)
(require 'haskell-session)
(require 'smartparens)
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)
;; haskell uses camelcase
(add-hook 'haskell-mode-hook 'subword-mode)
(add-hook 'haskell-cabal-mode-hook 'subword-mode)
;;(require 'shm)
;;(add-hook 'haskell-mode-hook 'structured-haskell-mode)
;;(set-face-background 'shm-current-face "#eee8d5")
;;(set-face-background 'shm-quarantine-face "lemonchiffon")

(define-key haskell-mode-map [f8] 'haskell-navigate-imports)
;; reminder: C-c C-. reformats imports
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)


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
     (define-key haskell-mode-map (kbd "C-c C-d") 'haskell-w3m-open-haddock)))

;; use a template when starting a new module
(add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)

(setq ghc-debug t)

(add-to-list 'load-path
               "~/.cabal/share/x86_64-linux-ghc-7.6.3/ghc-mod-5.0.1.2/")

(require 'ghc)

(defvar my-ghc-initialized)
(setq my-ghc-initialized nil) ;;christallfuckingmighty

(add-hook 'haskell-mode-hook
          (lambda ()
            (ghc-abbrev-init)
            (ghc-type-init)
            (unless my-ghc-initialized
              (ghc-comp-init)
              ;; (snip) misc keybinding here..
              (setq my-ghc-initialized t))
            (ghc-import-module)))

(defun hackage-doc (&optional pkg)
  "Open browser pointing to hackage for the given pkg. Opens hackage if pkg not specified."
  (interactive "sPackage (none for hackage homepage): ")
  (if (> (length pkg) 0)
      (browse-url (concat "http://hackage.haskell.org/package/" pkg))
      (browse-url "http://hackage.haskell.org")))

(defalias 'hd 'hackage-doc)

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
