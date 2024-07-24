;;; rc-lsp.el ---
(require 'use-package)

(use-package yasnippet
  :init
  (yas-global-mode 1)
  :ensure t)

(add-to-list 'load-path "~/.emacs.d/rc/lsp-bridge")

(require 'lsp-bridge)
(global-lsp-bridge-mode)

(require 'rc-go)

(provide 'rc-lsp)
;;; 
