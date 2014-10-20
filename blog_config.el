(defun new-blog-entry
  (title)
  (interactive "sTitle? ")
  (cl-flet
      ((sanitize (s) (replace-regexp-in-string (rx (1+ (not word))) "-" s))
       (squeeze-dash (s) (replace-regexp-in-string "-+" "-" s)))
    (let* ((date (format-time-string "%Y-%m-%d"))
           (filename (format
                      "posts/%s-%s.org"
                      date
                      (replace-regexp-in-string (rx (1+ (not word))) "-" title)))
           (heading (format "---\ntitle: %s\n---\n" title)))
      (find-file filename)
      (if (= 0 (buffer-size))
          (insert heading)))))
