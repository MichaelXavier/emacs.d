(require 'package)
(package-initialize)

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
 '(erc-autojoin-channels-alist (quote (("freenode.net" "#emacs" "#haskell" "#nothaskell" "#atunit" "##guitar"))))
 '(erc-modules (quote (autojoin button completion fill irccontrols list match menu move-to-prompt netsplit networks noncommands readonly ring services stamp track)))
 '(erc-nick "NemesisD")
 '(erc-prompt-for-nickserv-password t)
 '(erc-server-auto-reconnect t)
 '(erc-server-reconnect-attempts 5)
 '(exec-path (quote ("/usr/lib/erlang/bin" "/usr/local/sbin" "/usr/local/bin" "/usr/sbin" "/usr/bin" "/sbin" "/bin" "/usr/games" "/usr/local/games" "/usr/lib/emacs/24.3/x86_64-linux-gnu" "/opt/ghc/7.6.3/bin" "/opt/cabal/1.20/bin")))
 '(flycheck-haskell-runhaskell "runhaskell")
 '(flycheck-rubocop-lint-only t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-check-cabal-config-on-load t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-stylish-on-save nil)
 '(haskell-tags-on-save t)
 '(ido-auto-merge-work-directories-length -1)
 '(inferior-haskell-wait-and-jump t)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(js-indent-level 2)
 '(magit-use-overlays nil)
 '(package-archives (quote (("marmalade" . "http://marmalade-repo.org/packages/") ("gnu" . "http://elpa.gnu.org/packages/") ("melpa" . "http://melpa.milkbox.net/packages/"))))
 '(popwin:special-display-config (quote ((ag-mode) ("*All*" :height 15 :noselect t) ("*undo-tree*" :height 15 :noselect t) ("*Compile-Log*" :height 15 :noselect t) ("*Backtrace*" :height 15 :noselect t) ("*Messages*" :height 15 :noselect t) ("*Process List*" :height 15 :noselect t) ("*Warnings*" :height 15 :noselect t) ("*ag search" :height 15 :noselect t) ("*All*" :height 15 :noselect t) ("*undo-tree*" :height 15 :noselect t) ("*Compile-Log*" :height 15 :noselect t) ("*Backtrace*" :height 15 :noselect t) ("*Messages*" :height 15 :noselect t) ("*Process List*" :height 15 :noselect t) ("*Warnings*" :height 15 :noselect t) ("*Miniedit Help*" :noselect t) (help-mode) (completion-list-mode :noselect t) (compilation-mode :noselect t) (grep-mode :noselect t) (occur-mode :noselect t) ("*Pp Macroexpand Output*" :noselect t) ("*Shell Command Output*") ("*vc-diff*") ("*vc-change-log*") (" *undo-tree*" :width 60 :position right) ("^\\*anything.*\\*$" :regexp t) ("*slime-apropos*") ("*slime-macroexpansion*") ("*slime-description*") ("*slime-compilation*" :noselect t) ("*slime-xref*") (sldb-mode :stick t) (slime-repl-mode) (slime-connection-list-mode))))
 '(show-trailing-whitespace t)
 '(sp-ignore-modes-list (quote (minibuffer-inactive-mode erc-mode)))
 '(suggest-key-bindings t)
 '(typescript-indent-level 2)
 '(web-mode-disable-auto-opening t)
 '(web-mode-disable-auto-pairing t))

(load "~/.emacs.d/general_config.el")
(load "~/.emacs.d/haskell_config.el")
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
