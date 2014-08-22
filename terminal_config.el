;; shell-mode
(defun sh ()
  (interactive)
  (ansi-term "/bin/zsh"))

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

(require 'tramp)
(setq tramp-default-method "ssh")
