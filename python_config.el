;; python mode configuration
(require 'yapfify)
(require 'python)
(require 'flycheck-mypy)


(defun python-smart-format ()
  "If a region is selected, yapfify that region, otherwise, yapfify the buffer"
  (interactive)
  (if (use-region-p)
      (yapfify-region (region-beginning) (region-end))
    (yapfify-buffer)))

;; Run file or region through yapf on M-q
(define-key python-mode-map (kbd "M-q") 'python-smart-format)


;; pylintrc files are standard configs
(add-to-list 'auto-mode-alist '(".pylintrc$" . conf-mode))
