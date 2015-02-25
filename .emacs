(require 'package)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(custom-enabled-themes (quote (solarized-light)))
 '(custom-safe-themes (quote ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "77bd459212c0176bdf63c1904c4ba20fce015f730f0343776a1a14432de80990" "c1fb68aa00235766461c7e31ecfc759aa2dd905899ae6d95097061faeb72f9ee" "7feeed063855b06836e0262f77f5c6d3f415159a98a9676d549bfeb6c49637c4" default)))
 '(dabbrev-case-fold-search nil)
 '(enh-ruby-bounce-deep-indent nil)
 '(enh-ruby-deep-indent-paren-style nil)
 '(erc-autojoin-channels-alist (quote (("freenode.net" "#haskell-lens" "#purescript" "#emacs" "#haskell" "#nothaskell" "#atunit" "##guitar"))))
 '(erc-modules (quote (autojoin button completion fill irccontrols list match menu move-to-prompt netsplit networks noncommands readonly ring services stamp track)))
 '(erc-nick "NemesisD")
 '(erc-prompt-for-nickserv-password t)
 '(erc-server-auto-reconnect t)
 '(erc-server-reconnect-attempts 5)
 '(flycheck-disabled-checkers (quote (make emacs-lisp-checkdoc)))
 '(flycheck-display-errors-function (quote flycheck-display-error-messages-unless-error-list))
 '(flycheck-haskell-runhaskell "runhaskell")
 '(flycheck-rubocop-lint-only t)
 '(haskell-align-imports-pad-after-name nil)
 '(haskell-interactive-mode-scroll-to-bottom t)
 '(haskell-mode-contextual-import-completion nil)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-check-cabal-config-on-load t)
 '(haskell-process-log t)
 '(haskell-process-suggest-add-package nil)
 '(haskell-process-suggest-language-pragmas nil)
 '(haskell-process-suggest-overloaded-strings nil)
 '(haskell-process-suggest-remove-import-lines nil)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-stylish-on-save nil)
 '(haskell-tags-on-save t)
 '(ido-auto-merge-work-directories-length -1)
 '(inferior-haskell-wait-and-jump t)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(js-indent-level 2)
 '(json-reformat:indent-width 2)
 '(magit-use-overlays nil)
 '(org-export-backends (quote (ascii html icalendar latex md)))
 '(org-mobile-directory "~/Dropbox/org/MobileOrg")
 '(org-src-fontify-natively t)
 '(package-archives (quote (("marmalade" . "http://marmalade-repo.org/packages/") ("gnu" . "http://elpa.gnu.org/packages/") ("melpa" . "http://melpa.milkbox.net/packages/"))))
 '(popwin:special-display-config (quote ((ag-mode :stick t) ("*All*" :height 15 :noselect t) ("*Flycheck error messages*" :regexp nil :height 15 :noselect t) ("*haskell-process-log*" :regexp nil :height 15 :noselect nil) ("*undo-tree*" :height 15 :noselect t) ("*Compile-Log*" :height 15 :noselect t) ("*Messages*" :height 15 :noselect t) ("*Process List*" :height 15 :noselect t) ("*Warnings*" :height 15 :noselect t) ("*ag search" :height 15 :noselect t :stick t) ("*All*" :height 15 :noselect t) ("*undo-tree*" :height 15 :noselect t) ("*Compile-Log*" :height 15 :noselect t) ("*Backtrace*" :height 15 :noselect t) ("*Messages*" :height 15 :noselect t) ("*Process List*" :height 15 :noselect t :stick nil) ("*Warnings*" :height 15 :noselect nil :stick t) ("*Miniedit Help*" :noselect t) (help-mode :stick t) (completion-list-mode :noselect t) (compilation-mode :noselect t) (grep-mode :noselect t) (occur-mode :noselect t) ("*Pp Macroexpand Output*" :noselect t) ("*Shell Command Output*") ("*vc-diff*") ("*vc-change-log*") (" *undo-tree*" :width 60 :position right) ("^\\*anything.*\\*$" :regexp t) ("*slime-apropos*") ("*slime-macroexpansion*") ("*slime-description*") ("*slime-compilation*" :noselect t) ("*slime-xref*") (sldb-mode :stick t) (slime-repl-mode) (slime-connection-list-mode) ("*HS-Error*" :height 15 :noselect t))))
 '(projectile-switch-project-action (quote dired-cwd))
 '(safe-local-variable-values (quote ((require-final-newline))))
 '(show-trailing-whitespace t)
 '(sp-autoescape-string-quote nil)
 '(sp-ignore-modes-list (quote (minibuffer-inactive-mode erc-mode)))
 '(sql-product (quote postgres))
 '(sql-server "localhost")
 '(suggest-key-bindings t)
 '(tags-case-fold-search nil)
 '(tags-revert-without-query t)
 '(typescript-indent-level 2)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-disable-auto-opening t)
 '(web-mode-disable-auto-pairing t)
 '(web-mode-markup-indent-offset 2)
 '(web-mode-sql-indent-offset 2)
 '(yas-indent-line (quote fixed))
 '(yas-prompt-functions (quote (yas-ido-prompt yas-completing-prompt yas-x-prompt yas-dropdown-prompt yas-no-prompt))))

(load "~/.emacs.d/general_config.el")
(load "~/.emacs.d/blog_config.el")
(load "~/.emacs.d/haskell_config.el")
(load "~/.emacs.d/purescript_config.el")
(load "~/.emacs.d/ruby_config.el")
(load "~/.emacs.d/typescript_config.el")
(load "~/.emacs.d/web_config.el")
(load "~/.emacs.d/org_config.el")
(load "~/.emacs.d/terminal_config.el")

(provide 'emacs)
;;; .emacs ends here
(put 'narrow-to-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
