(require 'package)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(custom-safe-themes
   (quote
    ("1db337246ebc9c083be0d728f8d20913a0f46edc0a00277746ba411c149d7fe5" default)))
 '(dabbrev-case-fold-search nil)
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
 '(flycheck-disabled-checkers (quote (make emacs-lisp-checkdoc)))
 '(flycheck-display-errors-function (quote ignore))
 '(flycheck-global-modes (quote (not org-mode haskell-mode)))
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
 '(magit-diff-use-overlays nil)
 '(magit-use-overlays nil)
 '(markdown-command "marked")
 '(org-agenda-files
   (quote
    ("/home/michael/Dropbox/org/soostone.org" "/home/michael/Dropbox/org/cars.org" "/home/michael/Dropbox/org/code.org" "/home/michael/Dropbox/org/code_reviews.org" "/home/michael/Dropbox/org/community.org" "/home/michael/Dropbox/org/emacs.org" "/home/michael/Dropbox/org/finances.org" "/home/michael/Dropbox/org/flagged.org" "/home/michael/Dropbox/org/laptops.org" "/home/michael/Dropbox/org/life.org" "/home/michael/Dropbox/org/meetings.org" "/home/michael/Dropbox/org/shortlist.org" "/home/michael/Dropbox/org/unified_data.org" "/home/michael/src/soostone/wunderground/README.org" "/home/michael/src/soostone/uri-bytestring/TODO.org" "/home/michael/src/soostone/tracker-packer/README.org" "/home/michael/src/soostone/skinner/README.org" "/home/michael/src/soostone/sage/README.org" "/home/michael/src/soostone/sage/design.org" "/home/michael/src/soostone/referer-parser/TODO.org" "/home/michael/src/soostone/orbital/TODO.org" "/home/michael/src/soostone/leash/README.org" "/home/michael/src/soostone/katip/TODO.org" "/home/michael/src/soostone/hs-phantomjs/README.org" "/home/michael/src/soostone/aws-cloudfront/README.org" "/home/michael/src/soostone/aws/README.org")))
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
    (("marmalade" . "http://marmalade-repo.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.milkbox.net/packages/"))))
 '(pomodoro-long-break-time 10)
 '(pomodoro-play-sounds nil)
 '(pomodoro-show-number t)
 '(pomodoro-work-start-message "Back to work, chum.")
 '(popwin:special-display-config
   (quote
    ((ag-mode :stick t)
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
     ("*HS-Error*" :height 15 :noselect t))))
 '(projectile-completion-system (quote helm))
 '(projectile-enable-caching t)
 '(projectile-switch-project-action (quote dired-cwd))
 '(restclient-inhibit-cookies t)
 '(restclient-log-request t)
 '(safe-local-variable-values
   (quote
    ((hindent-style . "chris-done")
     (flycheck-disabled-checkers
      (quote haskell-ghc))
     (require-final-newline))))
 '(show-trailing-whitespace t)
 '(sp-autoescape-string-quote nil)
 '(sp-ignore-modes-list (quote (minibuffer-inactive-mode erc-mode)))
 '(sql-postgres-login-params
   (quote
    ((user :default "michael")
     server
     (database :default "michael")
     (port :default 5432))))
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
