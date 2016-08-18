;; web-mode stuff
(require 'web-mode)
(require 'web-beautify)
;;TODO: DRY
(add-to-list 'auto-mode-alist '(".html$" . web-mode))
(add-to-list 'auto-mode-alist '(".eco$" . web-mode))
(add-to-list 'auto-mode-alist '(".jst$" . web-mode))
(add-to-list 'auto-mode-alist '(".liquid$" . web-mode))
(add-to-list 'auto-mode-alist '(".erb$" . web-mode))
(add-to-list 'auto-mode-alist '(".tpl$" . web-mode))
(add-to-list 'auto-mode-alist '(".bowerrc$" . json-mode))

(define-key web-mode-map (kbd "C-c C-s") 'yas/insert-snippet)


(eval-after-load 'js2-mode
  '(define-key js2-mode-map (kbd "C-c C-f") 'web-beautify-js))

(eval-after-load 'js
  '(define-key js-mode-map (kbd "C-c C-f") 'web-beautify-js))

(eval-after-load 'json-mode
  '(define-key json-mode-map (kbd "C-c C-f") 'web-beautify-js))

(eval-after-load 'sgml-mode
  '(define-key html-mode-map (kbd "C-c C-f") 'web-beautify-html))

(eval-after-load 'web-mode
  '(define-key web-mode-map (kbd "C-c C-f") 'web-beautify-html))

(eval-after-load 'css-mode
  '(define-key css-mode-map (kbd "C-c C-f") 'web-beautify-css))
