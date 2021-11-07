;; linum and auto pair
(global-linum-mode t)
(electric-pair-mode t)

(require 'use-package)

;; magit
(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

;; theme
(use-package moe-theme 
  :ensure t
  :load-path "themes"
  :init
  (setq moe-theme-highlight-buffer-id t)
  :config
  (load-theme 'moe-dark t))

;; neotree
(use-package neotree
  :ensure t
  :bind ("C-x z" . neotree-toggle))

(provide 'basic)
