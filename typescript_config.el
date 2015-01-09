;; typescript configurations
(add-to-list 'auto-mode-alist '(".ts$" . typescript-mode))
(require 'flycheck)
(flycheck-define-checker tslint
  "Use tslint to flycheck TypeScript code."
  :command ("tslint"
            "-f" source
            "-c" (eval (projectile-expand-root "tslint.json"))
            "-t" "prose")
  :error-patterns ((warning (file-name) "[" line ", " column "]: " (message)))
  :modes typescript-mode)
(add-to-list 'flycheck-checkers 'tslint)
