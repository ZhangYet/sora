;;; rc-c.el --- C/C++ configuration

(require 'use-package)

;; clangd LSP for C/C++ (replaces ggtags)
(use-package lsp-mode
  :hook ((c-mode . lsp-deferred)
         (c++-mode . lsp-deferred))
  :config
  (setq lsp-clients-clangd-args
        '("--header-insertion=never"
          "--background-index"
          "--clang-tidy"
          "--log=error")))

;; clang-format integration
(use-package clang-format
  :ensure t
  :bind (:map c-mode-base-map
              ("C-c f" . clang-format-buffer)))

;; C/C++ code style for bpftrace project
(setq-default c-basic-offset 2)
(setq c-default-style '((c-mode . "linux")
                        (c++-mode . "linux")
                        (other . "linux")))

(add-hook 'c-mode-common-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (c-set-offset 'inline-open 0)
            (when (derived-mode-p 'c++-mode)
              (setq flycheck-clang-language-standard "c++20"))))

(provide 'rc-c)
;;;
