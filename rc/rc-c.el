;;; rc-c.el ---
(use-package ggtags
  :ensure t
  :pin melpa-stable)

(add-hook 'c-mode-common-hook
	  (lambda ()
	    (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
	      (ggtags-mode 1))))
(use-package eglot
  :ensure t)

(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)

(setq c-default-style "gnu")
(setq-default c-basic-offset 8
	      tab-width 8
	      indent-tabs-mode t)

(provide 'rc-c)
;;;
