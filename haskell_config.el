;; haskell mode configuration
(require 'f)
(require 'haskell-session)
(require 'haskell-mode)
(require 'haskell)
(require 'smartparens)
(require 'shm)
(require 'shm-case-split)
(require 'ob-haskell)
(require 'projectile)
(require 'hindent)
(require 'mode-local)
(require 'ormolu)

(eval-after-load "haskell-mode"
  '(progn
     (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-file)
     (define-key haskell-mode-map (kbd "C-c C-;") 'haskell-process-reload-file)
     (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
     (define-key haskell-mode-map (kbd "C-c C-f") 'haskell-mode-stylish-buffer)
     (define-key haskell-mode-map (kbd "C-c C-o") 'ormolu-format)
     (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
     (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
     (define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
     (define-key haskell-mode-map (kbd "C-,") 'haskell-move-nested-left)
     (define-key haskell-mode-map (kbd "C-.") 'haskell-move-nested-right)
     (define-key haskell-mode-map (kbd "C-c C-d") 'haskell-w3m-open-haddock)
     ))

;; structured-haskell-mode keybindings
(define-key shm-map (kbd "C-w") 'shm/backward-kill-word)
(define-key shm-map (kbd "C-M-w") 'shm/copy-node)


;; (custom-theme-set-faces
;;  'birds-of-paradise-plus
;;  '(shm-current-face ((t (:background "#315057"))))
;;  '(shm-quarantine-face ((t (:background "#794544"))))
;;  )


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
  "Open browser pointing to stackage for the given pkg. Precede with C-u to open in hackage."
  (interactive (list
                (read-string (format "Package (%s): " (thing-at-point 'word))
                             nil nil (thing-at-point 'word))))
  (let ((url (if current-prefix-arg
                 "https://www.stackage.org/lts/package/"
                 "http://hackage.haskell.org/package/")))
       (browse-url (concat url pkg))))

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


;; So smartparens doesn't get confused at language pragmas
(sp-local-pair 'haskell-mode "{-#" "#-}")


(setq haskell-auto-insert-module-format-string
      "module %s\n    ( \n    ) where")

;; i still think this is what shm/copy-region is supposed to do. copy
;; the node but don't remove it

(defun shm/copy-node ()
  "Copy the current node."
  (interactive)
  (shm-kill-node nil nil nil t))

(add-hook 'haskell-mode-hook #'hindent-mode)
(define-key hindent-mode-map (kbd "C-c C-h") 'hindent-reformat-buffer)

;; Make it easier to toggle shm when it shits the bed
(defalias 'shm 'structured-haskell-mode)
