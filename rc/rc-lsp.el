;;; rc-lsp.el ---
(require 'use-package)

(use-package eglot
  :hook
  (go-mode . eglot-ensure))

(provide 'rc-lsp)
;;; 
