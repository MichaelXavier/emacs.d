;;; company-graphviz-dot.el --- Company completion function for
;;; graphviz-dot-mode

;; Copyright (C) Bjarte Johansen <bjarte.johansen@gmail.com>

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2 of
;; the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be
;; useful, but WITHOUT ANY WARRANTY; without even the implied
;; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
;; PURPOSE.  See the GNU General Public License for more details.

;; You should have received a copy of the GNU General Public
;; License along with this program; if not, write to the Free
;; Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,
;; MA 02111-1307 USA

;; Authors: Bjarte Johansen <bjarte.johansen@gmail.com>
;;          Pieter Pareit <pieter.pareit@gmail.com>
;; Homepage: http://ppareit.github.com/graphviz-dot-mode/
;; Created:
;; Last modified:
;; Version: 0.0.1
;; Keywords: mode dot dot-language dotlanguage graphviz graphs att company

;;; Commentary:

;;; Code:

(require 'company)
(require 'graphviz-dot-mode)

(eval-when-compile
  (require 'cl-lib))

(defun company-gz-dot--candidates (arg)
  "Return good candidates for the argument ARG for company."
  (all-completions arg
		   (cl-case (company-graphviz-dot--syntax-at-point)
		     (color graphviz-dot-color-keywords)
		     (value graphviz-dot-value-keywords)
		     ((comment string) nil)
		     (t graphviz-dot-attr-keywords))))

(defun company-graphviz-dot--syntax-at-point ()
  "Return the syntax at point.
This can be one of
 - 'comment
 - 'string
 - 'out
 - 'value
 - 'attribute
 - 'other"
  (let ((state (syntax-ppss)))
    (cond
     ((nth 4 state) 'comment)
     ((nth 3 state) 'string)
     ((not (nth 1 state)) 'out)
     (t (save-excursion
          (skip-chars-backward "^[,=\\[]{};")
          (backward-char)
          (cond
           ((looking-at "[\\[,]{};") 'attribute)
           ((looking-at "=") (progn
                               (backward-word 1)
                               (if (looking-at "[a-zA-Z]*color")
                                   'color
                                 'value)))
           (t 'other)))))))


(defun company-graphviz-dot-backend (command &optional arg &rest ignored)
  "Company back-end for `graphviz-dot-mode'.
In the signature, COMMAND, ARG and IGNORED are mandated by `company-mode'."
  (interactive (list 'interactive))
  (cl-case command
    (interactive (company-begin-backend 'company-graphviz-dot-backend))
    (prefix (and (eq major-mode 'graphviz-dot-mode)
                 (company-grab-symbol)))
    (candidates (company-gz-dot--candidates arg))
    (no-cache t)
    (require-match 'never)))

(add-to-list 'company-backends 'company-graphviz-dot-backend)

(provide 'company-graphviz-dot)
;;; company-graphviz-dot.el ends here
