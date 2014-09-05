;;marmalade/MELPA packages
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
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
 '(exec-path (quote ("/usr/lib/erlang/bin" "/usr/local/sbin" "/usr/local/bin" "/usr/sbin" "/usr/bin" "/sbin" "/bin" "/usr/games" "/usr/local/games" "/usr/lib/emacs/24.3/x86_64-linux-gnu" "/opt/ghc/7.8.2/bin" "/opt/cabal/1.20/bin")))
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
