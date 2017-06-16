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
        ("b" "Books" entry (file+headline "life.org" "books")
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

;; agenda commands dispatch from C-c a
(global-set-key (kbd "C-c a") 'org-agenda)


(setq org-agenda-custom-commands
      '(("u" "Unscheduled TODO"
         ((todo ""
                ((org-agenda-overriding-header "\nUnscheduled TODO")
                 (org-agenda-skip-function '(org-agenda-skip-entry-if 'timestamp)))))
         nil
         nil)))

(add-hook 'org-mode-hook #'yas-minor-mode)


(defun random-between (lowest highest)
  "Choose a positive random number between lowest and highest, inclusive"
  (- (random (+ highest lowest 1)) lowest))

;; function to select a random row from an org table. I think this may sometimes select the header row but whatever.
(defun org-choose-random-row ()
  "When within a org-mode tempalate, puts the cursor on a random line in the table's body. Good for choosing restaurants."
  (interactive)
  (when (org-at-table-p)
    (let* ((start (count-lines 1 (org-table-begin)))
           (finish (count-lines 1 (org-table-end)))
           (dest (random-between start finish)))
      (with-no-warnings (goto-line dest))))
  )

(defun org-archive-done-tasks ()
  (interactive)
  (org-map-entries
   (lambda ()
     (org-archive-subtree)
     (setq org-map-continue-from (outline-previous-heading)))
   "/DONE" 'tree))

(defun kill-org-buffers ()
  (interactive)
  (mapc (lambda (buffer)
          (when (eq 'org-mode (buffer-local-value 'major-mode buffer))
            (kill-buffer buffer)))
        (buffer-list)))
