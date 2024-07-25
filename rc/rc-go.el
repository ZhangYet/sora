;;; rc-go.el ---
(use-package go-mode
  :ensure t)

(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))


(provide 'rc-go)
;;;
