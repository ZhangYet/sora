;;; rc-go.el ---
(use-package go-mode
  :ensure t)

(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

(setq treesit-language-source-alist
      '( (go "https://github.com/tree-sitter/tree-sitter-go")
	 (gomod "https://github.com/camdencheek/tree-sitter-go-mod")))

(use-package treesit-auto
  :ensure t
  :demand t
  :config
  (global-treesit-auto-mode))

(provide 'rc-go)
;;;
