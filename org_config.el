(require 'org)
(require 'org-mobile)
(require 'org-capture)
(require 'projectile)
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



;; Lifted from github.com/acowley/dotfiles
;;;; Project Task Capture

;; I use a convention where projects have a ProjectName-notes.org file
;; in the project root directory. This file is used for design notes
;; and task lists. It can be good to setq `org-agenda-files' to
;; include all your active projects so that the tasks show up in the
;; org agenda view. I set this value in the
;; [[%3B%3B%3B%20Private%20Configuration][Private Configuration]]
;; section of this file.

;; With the given configuration "C-c c p" adds a TODO item to the
;; current project's notes file.
(defun find-project-notes ()
  "A project's notes file is defined as ProjectName-notes.org in
  the project root directory."
  (concat (file-name-as-directory (projectile-project-root)) "README.org"))

;; Capture templates for quick notetaking
(setq org-capture-templates
      '(("s" "Shortlist")
        ("st" "Today" entry (file+headline "shortlist.org" "Today")
              "* TODO %?\n")
        ("sw" "This Week" entry (file+headline "shortlist.org" "This Week")
              "* TODO %?\n")
        ("se" "Eventually" entry (file+headline "shortlist.org" "Eventually")
              "* TODO %?\n")
        ("p" "Project Task" entry (file+headline (find-project-notes) "Tasks")
         "* TODO %?\n")
        ("m" "Movies" entry (file+headline "life.org" "Movies")
         "* TODO %?\n")
        ("t" "TV" entry (file+headline "life.org" "TV")
         "* TODO %?\n")
        ("g" "Games" entry (file+headline "life.org" "Games")
         "* TODO %?\n")
        ))

(global-set-key (kbd "C-c c") 'org-capture)

(defun open-org-file ()
  "Open one of the files in org-directory"
  (interactive)
  (ido-find-file-in-dir org-directory))

(global-set-key (kbd "C-c o") 'open-org-file)

(setq org-agenda-files
      (append '("~/Dropbox/org")
              (f-glob "**/*.org" "~/src/soostone")
              (f-glob "**/*.org" "~/src/mine")))

;; take back C-c SPC
(define-key org-mode-map (kbd "C-c SPC") 'ace-jump-mode)

(add-hook 'org-mode-hook #'yas-minor-mode)
