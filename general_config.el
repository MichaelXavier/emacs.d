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

(projectile-global-mode)
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

(add-hook 'erc-mode-hook
          (lambda ()
            (setq show-trailing-whitespace nil)))

(exec-path-from-shell-initialize)

(setq ring-bell-function 'ignore)

;; startup buffers
(ielm) ;; more useful than scratcb

;; for browser textareas
(require 'edit-server)
(edit-server-start)

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(global-set-key (kbd "M-S-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "M-S-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-S-<down>") 'shrink-window)
(global-set-key (kbd "M-S-<up>") 'enlarge-window)

(yas-global-mode 1)

(defun disable-final-newline ()
    (interactive)
    (setq require-final-newline nil))

;: prevent emacs from asking if I want to reload the TAGS file all the time
(setq tags-revert-without-query 1)

(require 'company)
