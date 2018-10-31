(require 'package)
(package-initialize)
(require 'f)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(company-echo-truncate-lines nil)
 '(dabbrev-case-fold-search nil)
 '(dhall-format-command nil)
 '(dhall-format-options (quote ("--inplace")))
 '(dhall-use-header-line nil)
 '(dired-listing-switches "-alh")
 '(electric-indent-mode nil)
 '(enh-ruby-bounce-deep-indent nil)
 '(enh-ruby-deep-indent-paren-style nil)
 '(erc-autojoin-channels-alist
   (quote
    (("freenode.net" "#haskell-lens" "#purescript" "#emacs" "#haskell" "#nothaskell" "#atunit" "##guitar"))))
 '(erc-modules
   (quote
    (autojoin button completion fill irccontrols list match menu move-to-prompt netsplit networks noncommands readonly ring services stamp track)))
 '(erc-nick "NemesisD")
 '(erc-prompt-for-nickserv-password t)
 '(erc-server-auto-reconnect t)
 '(erc-server-reconnect-attempts 5)
 '(flycheck-check-syntax-automatically (quote (save idle-change mode-enabled)))
 '(flycheck-disabled-checkers (quote (make emacs-lisp-checkdoc)))
 '(flycheck-display-errors-function (quote ignore))
 '(flycheck-global-modes (quote (not org-mode haskell-mode)))
 '(flycheck-haskell-runhaskell "runhaskell")
 '(flycheck-idle-change-delay 1)
 '(flycheck-rubocop-lint-only t)
 '(global-eldoc-mode nil)
 '(haskell-align-imports-pad-after-name nil)
 '(haskell-interactive-mode-scroll-to-bottom t)
 '(haskell-mode-contextual-import-completion nil)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-check-cabal-config-on-load t)
 '(haskell-process-log t)
 '(haskell-process-suggest-add-package nil)
 '(haskell-process-suggest-language-pragmas nil)
 '(haskell-process-suggest-overloaded-strings nil)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote auto))
 '(haskell-stylish-on-save nil)
 '(haskell-tags-on-save nil)
 '(ido-auto-merge-work-directories-length -1)
 '(indent-tabs-mode nil)
 '(inferior-haskell-wait-and-jump t)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(js-indent-level 2)
 '(json-reformat:indent-width 2)
 '(large-file-warning-threshold 20000000)
 '(magit-diff-use-overlays nil)
 '(magit-use-overlays nil)
 '(markdown-command "marked")
 '(org-agenda-files (quote ("~/Dropbox/org")))
 '(org-export-backends (quote (ascii html icalendar latex md)))
 '(org-habit-show-all-today nil)
 '(org-habit-show-habits t)
 '(org-habit-show-habits-only-for-today nil)
 '(org-mobile-directory "~/Dropbox/org/MobileOrg")
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m)))
 '(org-src-fontify-natively t)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.milkbox.net/packages/")
     ("org" . "https://orgmode.org/elpa/"))))
 '(package-selected-packages
   (quote
    (dhall-mode thrift markdown-mode lua-mode smartparens f psc-ide web-mode yasnippet zoom-frm yaml-mode wgrep-ag web-beautify w3m urlenc tup-mode tuareg tss tracking tidy string-inflection smart-tab shorten shm sass-mode request-deferred purescript-mode projectile-ripgrep popwin ob-restclient multi-term magit lorem-ipsum less-css-mode js2-mode intero iedit ht hindent hi2 hexrgb hemisu-theme helm-projectile graphviz-dot-mode goto-last-change go-mode git-timemachine flycheck-haskell flx-ido feature-mode exec-path-from-shell evil ess enh-ruby-mode elisp-slime-nav edit-server edit-color-stamp dockerfile-mode cucumber-goto-step crontab-mode column-marker coffee-mode birds-of-paradise-plus-theme better-defaults ample-zen-theme ample-theme alert alchemist ag ace-jump-mode)))
 '(pomodoro-long-break-time 10)
 '(pomodoro-play-sounds nil)
 '(pomodoro-show-number t)
 '(pomodoro-work-start-message "Back to work, chum.")
 '(popwin:special-display-config
   (quote
    ((ag-mode :stick t)
     (ripgrep-search-mode :stick t)
     ("*All*" :height 15 :noselect t)
     ("*Flycheck error messages*" :regexp nil :height 15 :noselect t)
     ("*haskell-process-log*" :regexp nil :height 15 :noselect nil)
     ("*undo-tree*" :height 15 :noselect t)
     ("*Compile-Log*" :height 15 :noselect t)
     ("*Process List*" :height 15 :noselect t)
     ("*ag search" :height 15 :noselect t :stick t)
     ("*All*" :height 15 :noselect t)
     ("*undo-tree*" :height 15 :noselect t)
     ("*Compile-Log*" :height 15 :noselect t)
     ("*Backtrace*" :height 15 :noselect t)
     ("*Messages*" :height 15 :noselect t)
     ("*Process List*" :height 15 :noselect t :stick nil)
     ("*Warnings*" :height 15 :noselect nil :stick t)
     ("*dhall errors*" :height 10 :noselect t :stick t :tail nil)
     ("*Miniedit Help*" :noselect t)
     (help-mode :stick t)
     (completion-list-mode :noselect t)
     (compilation-mode :noselect t)
     (grep-mode :noselect t)
     (occur-mode :noselect t)
     ("*Pp Macroexpand Output*" :noselect t)
     ("*Shell Command Output*")
     ("*vc-diff*")
     ("*vc-change-log*")
     (" *undo-tree*" :width 60 :position right)
     ("^\\*anything.*\\*$" :regexp t)
     ("*slime-apropos*")
     ("*slime-macroexpansion*")
     ("*slime-description*")
     ("*slime-compilation*" :noselect t)
     ("*slime-xref*")
     (sldb-mode :stick t)
     (slime-repl-mode)
     (slime-connection-list-mode)
     ("*HS-Error*" :height 15 :noselect t)
     ("*xref*" :height 15 :noselect t))))
 '(projectile-completion-system (quote helm))
 '(projectile-enable-caching t)
 '(projectile-globally-ignored-directories
   (quote
    (".idea" ".ensime_cache" ".eunit" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" ".cabal-sandbox")))
 '(projectile-globally-ignored-file-suffixes (quote (".hi" ".dyn_hi" ".o" ".dyn_o" ".a" ".so")))
 '(projectile-switch-project-action (quote dired-cwd))
 '(psc-ide-debug nil)
 '(psc-ide-rebuild-on-save nil)
 '(restclient-inhibit-cookies t)
 '(restclient-log-request t)
 '(safe-local-variable-values
   (quote
    ((eval progn
           (add-to-list
            (quote exec-path)
            "/opt/purescript/0.11.5/bin"))
     (eval progn
           (add-to-list
            (quote exec-path)
            "/opt/purescript/0.11.4/bin"))
     (haskell-process-use-ghci . t)
     (haskell-indent-spaces . 4)
     (eval progn
           (add-to-list
            (quote exec-path)
            "/opt/purescript/0.10.7/bin"))
     (hindent-style . "chris-done")
     (flycheck-disabled-checkers
      (quote haskell-ghc))
     (require-final-newline))))
 '(shm-auto-insert-skeletons nil)
 '(show-trailing-whitespace t)
 '(sp-autoescape-string-quote nil)
 '(sp-ignore-modes-list (quote (minibuffer-inactive-mode erc-mode)))
 '(sql-postgres-login-params
   (quote
    ((user :default "michael")
     server
     (database :default "michael")
     port)))
 '(sql-product (quote postgres))
 '(sql-server "localhost")
 '(suggest-key-bindings t)
 '(tab-stop-list (quote (2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32)))
 '(tab-width 2)
 '(tags-add-tables t)
 '(tags-case-fold-search nil)
 '(tags-revert-without-query t)
 '(typescript-indent-level 2)
 '(warning-minimum-level :warning)
 '(warning-minimum-log-level :debug)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-disable-auto-opening t)
 '(web-mode-disable-auto-pairing t)
 '(web-mode-markup-indent-offset 2)
 '(web-mode-sql-indent-offset 2)
 '(yas-indent-line (quote fixed))
 '(yas-prompt-functions
   (quote
    (yas-ido-prompt yas-completing-prompt yas-x-prompt yas-dropdown-prompt yas-no-prompt))))

(load "~/.emacs.d/general_config.el")
(load "~/.emacs.d/blog_config.el")
(load "~/.emacs.d/haskell_config.el")
(load "~/.emacs.d/purescript_config.el")
(load "~/.emacs.d/ruby_config.el")
(load "~/.emacs.d/typescript_config.el")
(load "~/.emacs.d/web_config.el")
(load "~/.emacs.d/org_config.el")
(load "~/.emacs.d/terminal_config.el")
(load "~/.emacs.d/elisp_config.el")
(if (f-file? "~/.emacs.d/per_machine_config.el")
    (load "~/.emacs.d/per_machine_config.el"))

(provide 'emacs)
;;; .emacs ends here
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
