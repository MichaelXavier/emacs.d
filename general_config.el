(require 'smart-tab)
(require 'smartparens-config)
(require 'edit-server)
(require 'popwin)
(require 'winner)
(require 'browse-url)
(require 'yasnippet)
(require 'iedit)
(require 'projectile)
(require 'projectile-ripgrep)
(require 'ibuffer)
(require 'dumb-jump)
(require 'ivy)
(require 'counsel)
(require 'counsel-projectile)
(require 'swiper)
(require 'emojify)
(require 'magit)
(require 'envrc)
(require 'undo-tree)
(require 'hl-line+ "~/.emacs.d/hl-line+.el")
(require 'vline "~/.emacs.d/vline.el")
(require 'col-highlight "~/.emacs.d/col-highlight.el")
(require 'crosshairs "~/.emacs.d/crosshairs.el")

;; Turn on a cursor crosshair only on idle. This is sadly for
;; performance reasons because always on predictably introduces
;; noticeable lag.
(toggle-crosshairs-when-idle 1)
(col-highlight-set-interval 1)

;; when its bright out
;; (require 'solarized-theme)

;;
;; Themes
(let ((theme 'tao-yin))
  (load-theme theme t t)
  (enable-theme theme)
  )

;; (global-set-key (kbd "C-x t l") (lambda () (interactive) (enable-theme 'ample-light)))
;; (global-set-key (kbd "C-x t d") (lambda () (interactive) (enable-theme 'ample-zen)))
;; (global-set-key (kbd "C-x t f") (lambda () (interactive) (enable-theme 'fairyfloss)))


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

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

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

(setq create-lockfiles nil)

(global-smart-tab-mode 1)

;; assume all new files are modified so you can save them
(add-hook 'find-file-hooks 'assume-new-is-modified)
(defun assume-new-is-modified ()
  (when (not (file-exists-p (buffer-file-name)))
    (set-buffer-modified-p t)))

(when (fboundp 'winner-mode)
      (winner-mode 1))

;; hooks for all the modes i work in
(let ((allhooks '(enh-ruby-mode-hook
                  prog-mode-hook)))
  (dolist (hook allhooks)
    (add-hook hook
              '(lambda () (column-marker-1 80)))
    (add-hook hook 'linum-mode)
    (add-hook hook #'yas-minor-mode)))

(smartparens-global-mode t)

;; highlights matching pairs
(show-smartparens-global-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;
;; keybinding management
;; more suggested bindings here:
;; https://github.com/Fuco1/smartparens/wiki/Example-configuration
(define-key smartparens-mode-map (kbd "C-M-f") 'sp-forward-sexp)
(define-key smartparens-mode-map (kbd "C-M-b") 'sp-backward-sexp)

(define-key smartparens-mode-map (kbd "C-M-d") 'sp-down-sexp)
(define-key smartparens-mode-map (kbd "C-M-a") 'sp-backward-down-sexp)
(define-key smartparens-mode-map (kbd "C-S-a") 'sp-beginning-of-sexp)
(define-key smartparens-mode-map (kbd "C-S-d") 'sp-end-of-sexp)

(define-key smartparens-mode-map (kbd "C-M-e") 'sp-up-sexp)
(define-key emacs-lisp-mode-map (kbd ")") 'sp-up-sexp)
(define-key smartparens-mode-map (kbd "C-M-u") 'sp-backward-up-sexp)
(define-key smartparens-mode-map (kbd "C-M-t") 'sp-transpose-sexp)

(define-key smartparens-mode-map (kbd "C-M-n") 'sp-next-sexp)
(define-key smartparens-mode-map (kbd "C-M-p") 'sp-previous-sexp)

(define-key smartparens-mode-map (kbd "C-M-k") 'sp-kill-sexp)
(define-key smartparens-mode-map (kbd "C-M-w") 'sp-copy-sexp)

(define-key smartparens-mode-map (kbd "M-<delete>") 'sp-unwrap-sexp)
(define-key smartparens-mode-map (kbd "M-<backspace>") 'sp-backward-unwrap-sexp)

(define-key smartparens-mode-map (kbd "C-<right>") 'sp-forward-slurp-sexp)
(define-key smartparens-mode-map (kbd "C-<left>") 'sp-forward-barf-sexp)
(define-key smartparens-mode-map (kbd "C-M-<left>") 'sp-backward-slurp-sexp)
(define-key smartparens-mode-map (kbd "C-M-<right>") 'sp-backward-barf-sexp)

(define-key smartparens-mode-map (kbd "M-D") 'sp-splice-sexp)
(define-key smartparens-mode-map (kbd "C-M-<delete>") 'sp-splice-sexp-killing-forward)
(define-key smartparens-mode-map (kbd "C-M-<backspace>") 'sp-splice-sexp-killing-backward)
(define-key smartparens-mode-map (kbd "C-S-<backspace>") 'sp-splice-sexp-killing-around)

(define-key smartparens-mode-map (kbd "C-]") 'sp-select-next-thing-exchange)
(define-key smartparens-mode-map (kbd "C-<left_bracket>") 'sp-select-previous-thing)
(define-key smartparens-mode-map (kbd "C-M-]") 'sp-select-next-thing)

(define-key smartparens-mode-map (kbd "M-F") 'sp-forward-symbol)
(define-key smartparens-mode-map (kbd "M-B") 'sp-backward-symbol)

(define-key smartparens-mode-map (kbd "H-t") 'sp-prefix-tag-object)
(define-key smartparens-mode-map (kbd "H-p") 'sp-prefix-pair-object)
(define-key smartparens-mode-map (kbd "H-s c") 'sp-convolute-sexp)
(define-key smartparens-mode-map (kbd "H-s a") 'sp-absorb-sexp)
(define-key smartparens-mode-map (kbd "H-s e") 'sp-emit-sexp)
(define-key smartparens-mode-map (kbd "H-s p") 'sp-add-to-previous-sexp)
(define-key smartparens-mode-map (kbd "H-s n") 'sp-add-to-next-sexp)
(define-key smartparens-mode-map (kbd "H-s j") 'sp-join-sexp)
(define-key smartparens-mode-map (kbd "H-s s") 'sp-split-sexp)

;; via yegge
(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-c C-m") 'execute-extended-command)
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c C-k") 'kill-region)
;; so I can stop drafting emails
(global-set-key (kbd "C-x m") 'execute-extended-command)

(defalias 'qrr 'query-replace-regexp)
(defalias 'dtw 'delete-trailing-whitespace)
(defalias 'cr 'comment-region)
(defalias 'ucr 'uncomment-region)
(defalias 'bu 'browse-url)

(projectile-mode)
(defun sudo-find-file (file-name)
  "Like find file, but opens the file as root."
  (interactive "FSudo Find File: ")
  (let ((tramp-file-name (concat "/sudo::" (expand-file-name file-name))))
    (find-file tramp-file-name)))

;; Making oft-used keys repeatable
(define-key winner-mode-map (kbd "C-M-S-<left>") 'winner-undo)
(define-key winner-mode-map (kbd "C-M-S-<right>") 'winner-redo)

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

(defun replace-regexp-quiet (regexp to-string start end)
  (save-excursion
    (goto-char start)
    (while (re-search-forward regexp end t) ; NOERROR
      (replace-match to-string) )))

(defun decamelize-region (start end)
  "region to decamelize"
  (interactive "r")
  (progn (replace-regexp-quiet "\\B\\([A-Z]\\)" "_\\1" (region-beginning) (region-end))
         (downcase-region (region-beginning) (region-end))))

(defun save-buffer-always ()
  "Save the buffer even if it is not modified. Useful for triggering file-watching tools."
  (interactive)
  (set-buffer-modified-p t)
  (save-buffer))

(global-set-key (kbd "C-x C-s") 'save-buffer-always)

(setq browse-url-browser-function 'browse-url-generic
          browse-url-generic-program "firefox")

(add-hook 'erc-mode-hook
          (lambda ()
            (setq show-trailing-whitespace nil)))

(exec-path-from-shell-initialize)

(setq ring-bell-function 'ignore)

;; startup buffers
(ielm) ;; more useful than scratcb

;; for browser textareas
(edit-server-start)

(global-set-key (kbd "C-+") 'zoom-frm-in)
(global-set-key (kbd "C--") 'zoom-frm-out)
(global-set-key (kbd "C-0") 'zoom-frm-unzoom)

(global-set-key (kbd "M-S-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "M-S-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-S-<down>") 'shrink-window)
(global-set-key (kbd "M-S-<up>") 'enlarge-window)

(yas-reload-all)

(global-set-key (kbd "C-c C-s") 'yas/insert-snippet)

(defun disable-final-newline ()
    (interactive)
    (setq require-final-newline nil))

(popwin-mode 1)

(defun dired-cwd ()
  "Start dired in the current dir (needed for a nullary dired function)"
  (interactive)
  (dired "."))

;; Start org mode with auto wrapping
(add-hook 'org-mode-hook (lambda () (auto-fill-mode 1)))

;; alignment aliases
(defun align-colons (beg end)
  (interactive "r")
  (align-regexp beg end ":\\(\\s-*\\)" 1 1 t))

(defun align-dcolons (beg end)
  (interactive "r")
  (align-regexp beg end "::\\(\\s-*\\)" 1 1 t))

(defun align-c-comment (beg end)
  (interactive "r")
  (align-regexp beg end "\\(-*\\)//" 1 0 t))

(defun align-equals (beg end)
  (interactive "r")
  (align-regexp beg end "\\(\\s-*\\)=" 1 1 t))

(defalias 'arx 'align-regexp)
(defalias 'arxe 'align-equals)



;; Disasble the freeze-emacs-for-no-reason key
(global-set-key (kbd "C-z") 'ignore)


(set-frame-font (font-spec :family "Ubuntu Mono" :size 15))

;; Automatically follow changes to certain buffers
(add-to-list 'auto-mode-alist '(".log$" . auto-revert-mode))
(add-to-list 'auto-mode-alist '("haskell-process-log" . auto-revert-mode))

(defun increment-number-at-point ()
  (interactive)
  (skip-chars-backward "0123456789")
  (or (looking-at "[0123456789]+")
      (error "No number at point"))
  (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))

(add-to-list 'auto-mode-alist '("Cask$" . emacs-lisp-mode))

(add-hook 'after-init-hook #'global-flycheck-mode)

(add-to-list 'auto-mode-alist '(".envrc$" . sh-mode))

;; auto load crontab mode
(add-to-list 'auto-mode-alist '("\\.cron\\(tab\\)?\\'" . crontab-mode))
(add-to-list 'auto-mode-alist '("cron\\(tab\\)?\\."    . crontab-mode))

;(setq-default indent-tabs-mode nil)
;(setq-default tab-width 2)

(add-to-list 'auto-mode-alist '(".restclient$"  . restclient-mode))

(defalias 'ft 'find-tag)

; .sosrc files are yaml
(add-to-list 'auto-mode-alist '(".sosrc" . yaml-mode))


; Binds the normal C-/ to undo-tree-undo and C-S-/ aka C-? to undo-tree-redo
(global-undo-tree-mode)

; Bind simple kill-whole-line since sexp seems to take over C-S-backspace
(define-key global-map (kbd "C-S-k") 'kill-whole-line)

; set up the global command prefix for projectile to C-c C-p
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map)

; use ripgrep instead of ag
(define-key projectile-mode-map (kbd "C-c C-p s s") 'projectile-ripgrep)


; https://stackoverflow.com/a/65992
(defun toggle-window-dedicated ()
  "Toggle whether the current active window is dedicated. This is prevents buffers from usurping the window"
  (interactive)
  (message
   (if (let (window (get-buffer-window (current-buffer)))
         (set-window-dedicated-p window
                                 (not (window-dedicated-p window))))
       "Window '%s' is dedicated"
       "Window '%s' is not dedicated")
   (current-buffer)))

(define-key global-map (kbd "C-c d") 'toggle-window-dedicated)


; switch to ibuffer instead of list-buffers
(define-key global-map (kbd "C-x C-b") 'ibuffer)

; by default, filter group buffers by projectile root
(add-hook 'ibuffer-hook
    (lambda ()
      (ibuffer-projectile-set-filter-groups)
      (unless (eq ibuffer-sorting-mode 'alphabetic)
        (ibuffer-do-sort-by-alphabetic))))

(dumb-jump-mode)

;; if you run C-u C-M-g (universal argument), it will run the prompt version of dumb-jump-go
(defun custom-dumb-jump-go (&optional arg)
  "Delegates to dumb-jump-go. If given the universal argument, runs it with a prompt"
  (interactive "P")
  ;; If universal argument given, prompt
  (if current-prefix-arg
      (dumb-jump-go-prompt)
      (dumb-jump-go)))

(define-key dumb-jump-mode-map (kbd "C-M-g") 'custom-dumb-jump-go)

;; set up ivy/counsel/swiper
(ivy-mode t)
(counsel-mode t)
(counsel-projectile-mode t)
(global-set-key (kbd "C-s") 'swiper)

(add-hook 'after-init-hook #'global-emojify-mode)

(envrc-global-mode)

;; Previously hitting escape 3 times focuses the current window and
;; closes the others. I almost always hit it by accident since my
;; escape and ctrl are the same key
(global-unset-key "\e\e\e")
