;;; rc-lsp.el --- LSP mode configuration

(require 'use-package)

;; lsp-mode - Language Server Protocol support
(use-package lsp-mode
  :ensure t
  :init
  ;; Set the prefix key for LSP commands (C-c L to avoid conflict with org-store-link)
  (setq lsp-keymap-prefix "C-c L")
  ;; Performance optimizations
  (setq lsp-idle-delay 0.5)
  (setq lsp-log-io nil)
  (setq lsp-enable-snippet nil)
  :commands (lsp lsp-deferred)
  :hook
  ;; Enable LSP for shell scripts
  (sh-mode . lsp)
  ;; Optional: Enable origami folding if available
  (lsp-after-open-hook . (lambda ()
                           (when (fboundp 'lsp-origami-try-enable)
                             (lsp-origami-try-enable))))
  :config
  ;; General LSP settings
  (setq lsp-auto-guess-root t)
  (setq lsp-restart 'auto-restart)
  ;; Configure xref to use LSP backend
  (add-to-list 'xref-backend-functions 'lsp-xref-backend))

(provide 'rc-lsp)
;;;
