;;; rc-lsp
(require 'use-package)

(use-package lsp-mode 
  :ensure t)

;;; bash
(if (getenv "BASH_LSP_INSTALLED")
    (progn (message "bash lsp loaded")
	   (add-hook 'sh-mode-hook 'lsp)))
;;; c
(if (executable-find "clangd-12")
    (progn
      (add-hook 'c-mode-hook #'lsp-deferred)
      (add-hook 'c++-mode-hook #'lsp-deferred)))

;;; go
(if (executable-find "gopls")
    (progn
      (add-hook 'go-mode-hook #'lsp-deferred)
      (defun lsp-go-install-save-hooks ()
	(add-hook 'before-save-hook #'lsp-format-buffer t t)
	(add-hook 'before-save-hook #'lsp-organize-imports t t))
      (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)))

;;; python

(provide 'rc-lsp)
;;;
