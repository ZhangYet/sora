;;; rc-lsp.el ---
(require 'use-package)

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :commands lsp-mode
  :hook
  (sh-mode . lsp)
  (lsp-after-open-hook . lsp-origami-try-enable))

(provide 'rc-lsp)
;;; 
