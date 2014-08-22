(setq org-log-done 'time)

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
