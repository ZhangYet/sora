;;; rc-scheme.el --- Scheme development configuration

(require 'use-package)

(use-package geiser
  :ensure t)

(use-package geiser-guile
  :ensure t
  :after geiser
  :config
  (setq geiser-default-implementation 'guile))

(use-package scheme
  :ensure nil
  :bind
  (:map scheme-mode-map
        ("C-x C-e" . geiser-eval-last-sexp)
        ("C-c C-z" . geiser-mode-switch-to-repl)
        ("C-c C-c" . geiser-eval-definition)))

(provide 'rc-scheme)
;;; rc-scheme.el ends here
