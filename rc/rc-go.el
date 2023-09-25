;;; rc-go.el ---
(require 'use-package)

(use-package go-mode
  :ensure t
  :config
  (require 'lsp-bridge)
  (add-hook 'go-mode-hook 'lsp-bridge-mode))

(provide 'rc-go)
;;; 
