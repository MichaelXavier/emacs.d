;;; fairyfloss-theme.el --- an Emacs 24 theme based on Monokai (tmTheme)
;;
;;; Author: Auto Converted to Emacs 24 by tmtheme-to-deftheme (tm2deftheme)
;;; Version: 1463188844
;;; Original author:
;;; Url: https://github.com/emacsfodder/tmtheme-to-deftheme
;;; Package-Requires: ((emacs "24.0"))
;;
;;; Commentary:
;;  This theme was automatically generated by tmtheme-to-deftheme (tm2deftheme),
;;  from Monokai (tmTheme) by
;;
;;; Code:

(deftheme fairyfloss
  "fairyfloss-theme- Created by tmtheme-to-deftheme - 2016-05-13 18:20:44 -0700")

(custom-theme-set-variables
 'fairyfloss
)

(custom-theme-set-faces
 'fairyfloss
 ;; basic theming.

 '(default ((t (:foreground "#F8F8F2" :background "#5A5475" ))))
 '(region  ((t (:background "#49483E"))))
 '(cursor  ((t (:background "#F8F8F0"))))

 ;; Temporary defaults
 '(linum                               ((t (:foreground "#7a758e"  :background "#6a6482" ))))
 '(fringe                              ((t (                       :background "#6a6482" ))))

 '(minibuffer-prompt                   ((t (:foreground "#1695D0"  :background nil       :weight bold                                  ))))
 '(error                               ((t (:foreground "#FB491C"  :background nil       :weight bold                                  ))))
 '(escape-glyph                        ((t (:foreground "orange"   :background nil                                                     ))))
 '(highlight                           ((t (:foreground "orange"   :background nil                                                     ))))
 '(shadow                              ((t (:foreground "#777777"  :background nil                                                     ))))

 '(trailing-whitespace                 ((t (:foreground "#FFFFFF"  :background "#C74000"                                               ))))
 '(link                                ((t (:foreground "#00b7f0"  :background nil       :underline t                                  ))))
 '(link-visited                        ((t (:foreground "#4488cc"                        :underline t :inherit (link)                  ))))
 '(button                              ((t (:foreground "#FFFFFF"  :background "#444444" :underline t :inherit (link)                  ))))
 '(next-error                          ((t (                                             :inherit (region)                             ))))
 '(query-replace                       ((t (                                             :inherit (isearch)                            ))))
 '(header-line                         ((t (:foreground "#EEEEEE"  :background "#444444" :box nil :inherit (mode-line)                 ))))

 '(mode-line-highlight                 ((t (                                             :box nil                                      ))))
 '(mode-line-emphasis                  ((t (                                             :weight bold                                  ))))
 '(mode-line-buffer-id                 ((t (                                             :box nil :weight bold                         ))))

 '(mode-line-inactive                  ((t (:foreground "#d6d6b2"  :background "#6a6482" :box nil :weight light :inherit (mode-line)   ))))
 '(mode-line                           ((t (:foreground "#f8f8f2"  :background "#6a6482" :box nil ))))

 '(isearch                             ((t (:foreground "#99ccee"  :background "#444444"                                               ))))
 '(isearch-fail                        ((t (                       :background "#ffaaaa"                                               ))))
 '(lazy-highlight                      ((t (                       :background "#77bbdd"                                               ))))
 '(match                               ((t (                       :background "#3388cc"                                               ))))

 '(tooltip                             ((t (:foreground "black"    :background "LightYellow" :inherit (variable-pitch)                 ))))

 '(js3-function-param-face             ((t (:foreground "#BFC3A9"                                                                      ))))
 '(js3-external-variable-face          ((t (:foreground "#F0B090"  :bold t                                                             ))))

 '(secondary-selection                 ((t (                       :background "#342858"                                               ))))
 '(cua-rectangle                       ((t (:foreground "#E0E4CC"  :background "#342858" ))))

 ;; Magit hightlight
 '(magit-item-highlight                ((t (:foreground "white" :background "#1278A8" :inherit nil ))))

 ;; flyspell-mode
 '(flyspell-incorrect                  ((t (:underline "#AA0000" :background nil :inherit nil ))))
 '(flyspell-duplicate                  ((t (:underline "#009945" :background nil :inherit nil ))))

 ;; flymake-mode
 '(flymake-errline                     ((t (:underline "#AA0000" :background nil :inherit nil ))))
 '(flymake-warnline                    ((t (:underline "#009945" :background nil :inherit nil ))))

 ;;git-gutter
 '(git-gutter:added                    ((t (:foreground "#609f60" :bold t))))
 '(git-gutter:modified                 ((t (:foreground "#3388cc" :bold t))))
 '(git-gutter:deleted                  ((t (:foreground "#cc3333" :bold t))))

 '(diff-added                          ((t (:background "#305030"))))
 '(diff-removed                        ((t (:background "#903010"))))
 '(diff-file-header                    ((t (:background "#362145"))))
 '(diff-context                        ((t (:foreground "#E0E4CC"))))
 '(diff-changed                        ((t (:foreground "#3388cc"))))
 '(diff-hunk-header                    ((t (:background "#242130"))))


 '(font-lock-comment-face ((t (:foreground "#E6C000"  ))))
 '(font-lock-string-face ((t (:foreground "#FFEA00"  ))))
 '(font-lock-builtin-face ((t (:foreground "#C5A3FF"  ))))
 '(font-lock-variable-name-face ((t (  ))))
 '(font-lock-keyword-face ((t (:foreground "#FFB8D1"  ))))
 '(font-lock-type-face ((t (:foreground "#FFF352"  :underline t))))
 '(font-lock-function-name-face ((t (:foreground "#FFF352"  ))))
 '(js3-function-param-face ((t (:foreground "#FF857F"  :italic t))))
 '(js2-function-param ((t (:foreground "#FF857F"  :italic t))))
 '(font-lock-warning-face ((t (:foreground "#F8F8F0" :background "#AE81FF" ))))
 '(font-lock-comment-delimiter-face ((t (:foreground "#E6C000"  ))))

;; Rainbow delimiters
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#b35e59"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#bb706b"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#c4827e"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#cc9490"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#d5a5a2"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#ddb7b5"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#e5c9c7"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#eedbda"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#f6ecec"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "#FF0000"))))
) ;; End face definitions

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'fairyfloss)

;; Local Variables:
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode +1))
;; End:

;;; fairyfloss-theme.el ends here
