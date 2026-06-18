;;; rc-lsp.el --- LSP mode configuration

(require 'use-package)

;; lsp-mode - Language Server Protocol support
(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c L")
  (setq lsp-idle-delay 0.3)
  (setq lsp-log-io nil)
  (setq lsp-enable-snippet nil)
  (setq lsp-auto-guess-root t)
  (setq lsp-restart 'auto-restart)
  (setq lsp-completion-provider :capf)
  :commands (lsp lsp-deferred)
  :hook
  ((sh-mode . lsp)
   (c-mode . lsp-deferred)
   (c++-mode . lsp-deferred)
   (python-mode . lsp-deferred))
  :config
  (when (fboundp 'lsp-xref-backend)
    (add-to-list 'xref-backend-functions 'lsp-xref-backend)))

;; lsp-ui - UI enhancements for LSP
(use-package lsp-ui
  :ensure t
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-position 'at-point
        lsp-ui-sideline-enable t
        lsp-ui-sideline-show-hover t)
  :bind (:map lsp-mode-map
              ("C-c L d" . lsp-ui-doc-show)))

(provide 'rc-lsp)
;;;
