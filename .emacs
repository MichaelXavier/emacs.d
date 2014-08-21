;; shell-mode
(defun sh ()
  (interactive)
  (ansi-term "/bin/zsh"))

;;marmalade/MELPA packages
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'tramp)
(setq tramp-default-method "ssh")

;;
;; ace jump mode major function
;;
(add-to-list 'load-path "/full/path/where/ace-jump-mode.el/in/")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)



;;
;; enable a more powerful jump back function from ace jump mode
;;
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;; haskell mode configuration
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;; haskell uses camelcase
(add-hook 'haskell-mode-hook 'subword-mode)
;;(require 'shm)
;;(add-hook 'haskell-mode-hook 'structured-haskell-mode)
;;(set-face-background 'shm-current-face "#eee8d5")
;;(set-face-background 'shm-quarantine-face "lemonchiffon")
(define-key haskell-mode-map [f8] 'haskell-navigate-imports)
;; reminder: C-c C-. reformats imports
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (solarized-light)))
 '(custom-safe-themes (quote ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "77bd459212c0176bdf63c1904c4ba20fce015f730f0343776a1a14432de80990" "c1fb68aa00235766461c7e31ecfc759aa2dd905899ae6d95097061faeb72f9ee" "7feeed063855b06836e0262f77f5c6d3f415159a98a9676d549bfeb6c49637c4" default)))
 '(dabbrev-case-fold-search nil)
 '(enh-ruby-bounce-deep-indent nil)
 '(enh-ruby-deep-indent-paren-style nil)
 '(erc-autojoin-channels-alist (quote (("freenode.net" "#emacs" "#haskell" "#nothaskell" "#atunit"))))
 '(erc-modules (quote (autojoin button completion fill irccontrols list match menu move-to-prompt netsplit networks noncommands readonly ring services stamp track)))
 '(erc-nick "NemesisD")
 '(erc-prompt-for-nickserv-password t)
 '(erc-server-auto-reconnect t)
 '(exec-path (quote ("/usr/lib/erlang/bin" "/usr/local/sbin" "/usr/local/bin" "/usr/sbin" "/usr/bin" "/sbin" "/bin" "/usr/games" "/usr/local/games" "/usr/lib/emacs/24.3/x86_64-linux-gnu" "/opt/ghc/7.8.2/bin" "/opt/cabal/1.20/bin")))
 '(flycheck-haskell-runhaskell "runhaskell")
 '(flycheck-rubocop-lint-only t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-check-cabal-config-on-load t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-stylish-on-save nil)
 '(ido-auto-merge-work-directories-length -1)
 '(inferior-haskell-wait-and-jump t)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(js-indent-level 2)
 '(magit-use-overlays nil)
 '(show-trailing-whitespace t)
 '(sp-ignore-modes-list (quote (minibuffer-inactive-mode erc-mode)))
 '(suggest-key-bindings t)
 '(typescript-indent-level 2)
 '(web-mode-disable-auto-opening t)
 '(web-mode-disable-auto-pairing t))

;; rebind inferior mode to interactive mode
(eval-after-load "haskell-mode"
  '(progn
     (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
     (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
     (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
     (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
     (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
     (define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
     (define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
     (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)))

;; haddocks with w3m cargo culted from https://github.com/haskell/haskell-mode/wiki/Browsing-Haddocks
(setq w3m-mode-map (make-sparse-keymap))

(define-key w3m-mode-map (kbd "RET") 'w3m-view-this-url)
(define-key w3m-mode-map (kbd "q") 'bury-buffer)
(define-key w3m-mode-map (kbd "<mouse-1>") 'w3m-maybe-url)
(define-key w3m-mode-map [f5] 'w3m-reload-this-page)
(define-key w3m-mode-map (kbd "C-c C-d") 'haskell-w3m-open-haddock)
(define-key w3m-mode-map (kbd "M-<left>") 'w3m-view-previous-page)
(define-key w3m-mode-map (kbd "M-<right>") 'w3m-view-next-page)
(define-key w3m-mode-map (kbd "M-.") 'w3m-haddock-find-tag)

(defun w3m-maybe-url ()
  (interactive)
  (if (or (equal '(w3m-anchor) (get-text-property (point) 'face))
          (equal '(w3m-arrived-anchor) (get-text-property (point) 'face)))
      (w3m-view-this-url)))

(require 'w3m-haddock)
(add-hook 'w3m-display-hook 'w3m-haddock-display)

(define-key haskell-mode-map (kbd "C-c C-d") 'haskell-w3m-open-haddock)

(add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(global-linum-mode 1)
(column-number-mode 1)
;;(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq backup-inhibited t)
(setq auto-save-default nil)

(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

;; I think this borks calendar in org mode
;;(defadvice split-window (after move-point-to-new-window activate)
;;  "Moves the point to the newly created window after splitting."
;;  (other-window 1))

(setq org-log-done 'time)

;; ruby configurations
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Bowerfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '(".gemspec$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '(".ru$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '(".rake$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '(".god$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '(".rabl$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Procfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("yml.sample$" . yaml-mode))

;; typescript configurations
(add-to-list 'auto-mode-alist '(".ts$" . typescript-mode))

;; web-mode stuff
(add-to-list 'auto-mode-alist '(".html$" . web-mode))
(add-to-list 'auto-mode-alist '(".eco$" . web-mode))
(add-to-list 'auto-mode-alist '(".jst$" . web-mode))
(add-to-list 'auto-mode-alist '(".liquid$" . web-mode))
(add-to-list 'auto-mode-alist '(".html.erb$" . web-mode))


(projectile-global-mode)

(setq create-lockfiles nil)

(require 'smart-tab)
(global-smart-tab-mode 1)

;; assume all new files are modified so you can save them
(add-hook 'find-file-hooks 'assume-new-is-modified)
(defun assume-new-is-modified ()
  (when (not (file-exists-p (buffer-file-name)))
    (set-buffer-modified-p t)))

(when (fboundp 'winner-mode)
      (winner-mode 1))

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))

;; hooks for all the modes i work in
(setq allhooks '(enh-ruby-mode-hook
                 prog-mode-hook))
(dolist (hook allhooks)
  (add-hook hook
            '(lambda () (column-marker-1 80))))
(dolist (hook allhooks)
  (add-hook hook 'flycheck-mode))

(require 'smartparens-config)
(smartparens-global-mode t)

;; highlights matching pairs
(show-smartparens-global-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;
;; keybinding management
;; more suggested bindings here:
;; https://github.com/Fuco1/smartparens/wiki/Example-configuration
(define-key sp-keymap (kbd "C-M-f") 'sp-forward-sexp)
(define-key sp-keymap (kbd "C-M-b") 'sp-backward-sexp)

(define-key sp-keymap (kbd "C-M-d") 'sp-down-sexp)
(define-key sp-keymap (kbd "C-M-a") 'sp-backward-down-sexp)
(define-key sp-keymap (kbd "C-S-a") 'sp-beginning-of-sexp)
(define-key sp-keymap (kbd "C-S-d") 'sp-end-of-sexp)

(define-key sp-keymap (kbd "C-M-e") 'sp-up-sexp)
(define-key emacs-lisp-mode-map (kbd ")") 'sp-up-sexp)
(define-key sp-keymap (kbd "C-M-u") 'sp-backward-up-sexp)
(define-key sp-keymap (kbd "C-M-t") 'sp-transpose-sexp)

(define-key sp-keymap (kbd "C-M-n") 'sp-next-sexp)
(define-key sp-keymap (kbd "C-M-p") 'sp-previous-sexp)

(define-key sp-keymap (kbd "C-M-k") 'sp-kill-sexp)
(define-key sp-keymap (kbd "C-M-w") 'sp-copy-sexp)

(define-key sp-keymap (kbd "M-<delete>") 'sp-unwrap-sexp)
(define-key sp-keymap (kbd "M-<backspace>") 'sp-backward-unwrap-sexp)

(define-key sp-keymap (kbd "C-<right>") 'sp-forward-slurp-sexp)
(define-key sp-keymap (kbd "C-<left>") 'sp-forward-barf-sexp)
(define-key sp-keymap (kbd "C-M-<left>") 'sp-backward-slurp-sexp)
(define-key sp-keymap (kbd "C-M-<right>") 'sp-backward-barf-sexp)

(define-key sp-keymap (kbd "M-D") 'sp-splice-sexp)
(define-key sp-keymap (kbd "C-M-<delete>") 'sp-splice-sexp-killing-forward)
(define-key sp-keymap (kbd "C-M-<backspace>") 'sp-splice-sexp-killing-backward)
(define-key sp-keymap (kbd "C-S-<backspace>") 'sp-splice-sexp-killing-around)

(define-key sp-keymap (kbd "C-]") 'sp-select-next-thing-exchange)
(define-key sp-keymap (kbd "C-<left_bracket>") 'sp-select-previous-thing)
(define-key sp-keymap (kbd "C-M-]") 'sp-select-next-thing)

(define-key sp-keymap (kbd "M-F") 'sp-forward-symbol)
(define-key sp-keymap (kbd "M-B") 'sp-backward-symbol)

(define-key sp-keymap (kbd "H-t") 'sp-prefix-tag-object)
(define-key sp-keymap (kbd "H-p") 'sp-prefix-pair-object)
(define-key sp-keymap (kbd "H-s c") 'sp-convolute-sexp)
(define-key sp-keymap (kbd "H-s a") 'sp-absorb-sexp)
(define-key sp-keymap (kbd "H-s e") 'sp-emit-sexp)
(define-key sp-keymap (kbd "H-s p") 'sp-add-to-previous-sexp)
(define-key sp-keymap (kbd "H-s n") 'sp-add-to-next-sexp)
(define-key sp-keymap (kbd "H-s j") 'sp-join-sexp)
(define-key sp-keymap (kbd "H-s s") 'sp-split-sexp)

;; via yegge
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
;; so I can stop drafting emails
(global-set-key "\C-xm" 'execute-extended-command)

(defalias 'qrr 'query-replace-regexp)
(defalias 'arx 'align-regexp)
(defalias 'dtw 'delete-trailing-whitespace)
(defalias 'cr 'comment-region)
(defalias 'ucr 'uncomment-region)
(defalias 'bu 'browse-url)

;; org mode settings
(setq org-directory "~/Dropbox/org")
(setq org-mobile-directory "~/Dropbox/org/MobileOrg")
(add-to-list 'auto-mode-alist '(".org$" . org-mode))
(setq org-mobile-inbox-for-pull "~/Dropbox/org/flagged.org")
(setq org-mobile-files (file-expand-wildcards "~/Dropbox/org/*.org"))

;; Cucumber
;; Use the less busted jump-to-cucumber-step
(defun swap-cucumber-key-bindings ()
  "Swap out bindings in cucumber mode for better ones"
  (local-set-key (kbd "C-c , g") 'jump-to-cucumber-step)
  )
(add-hook 'feature-mode-hook 'swap-cucumber-key-bindings)

(defun sudo-find-file (file-name)
  "Like find file, but opens the file as root."
  (interactive "FSudo Find File: ")
  (let ((tramp-file-name (concat "/sudo::" (expand-file-name file-name))))
    (find-file tramp-file-name)))

;; Making oft-used keys repeatable
(define-key winner-mode-map (kbd "C-M-S-<left>") 'winner-undo)
(define-key winner-mode-map (kbd "C-M-S-<right>") 'winner-redo)

;; http://stackoverflow.com/questions/3465567/how-to-use-ssh-and-sudo-together-with-tramp-in-emacs
(set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))

;; Easily navigate around buffers
(global-set-key (kbd "C-S-p") 'previous-multiframe-window)
(global-set-key (kbd "C-S-n") 'next-multiframe-window)

;; Ensure ssh config gets identified as a ssh config and not a generic config file
(add-to-list 'auto-mode-alist '(".ssh/config\\'"  . ssh-config-mode))
(add-to-list 'auto-mode-alist '("sshd?_config\\'" . ssh-config-mode))
(add-hook 'ssh-config-mode-hook 'turn-on-font-lock)

;; Silly function that comes in handy once in a blue moon
(defun reverse-region (start end)
  "region to reverse"
  (interactive "r")
  (let ((reversed (concat (reverse (string-to-list (buffer-substring-no-properties start end))))))
    (save-excursion
      (delete-region start end)
      (goto-char start)
      (insert reversed) )) )

(defun decamelize-region (start end)
  "region to decamelize"
  (interactive "r")
  (progn (replace-regexp "\\B\\([A-Z]\\)" "_\\1" nil (region-beginning) (region-end))
         (downcase-region (region-beginning) (region-end))))

(defun save-buffer-always ()
  "Save the buffer even if it is not modified. Useful for triggering file-watching tools."
  (interactive)
  (set-buffer-modified-p t)
  (save-buffer))

(global-set-key "\C-x\C-s" 'save-buffer-always)

(setq browse-url-browser-function 'browse-url-generic
          browse-url-generic-program "google-chrome-beta")

(setq multi-term-program "/bin/zsh")
(setq multi-term-program-switches "--login")

;; Some settings for term mode
(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 10000)
            (setq show-trailing-whitespace nil)))

;; Term mode keybindings
(add-hook 'term-mode-hook
          (lambda ()
            (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
            (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next))
            (define-key term-raw-map (kbd "C-y") 'term-paste)))

(global-set-key (kbd "C-c t") 'multi-term)

(add-hook 'erc-mode-hook
          (lambda ()
            (setq show-trailing-whitespace nil)))

(exec-path-from-shell-initialize)

(setq ring-bell-function 'ignore)

;; startup buffers
(ielm) ;; more useful than scratcb

(provide 'emacs)
;;; .emacs ends here
