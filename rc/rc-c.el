;;; rc-c.el ---
(use-package ggtags
  :ensure t
  :pin melpa-stable)

(add-hook 'c-mode-common-hook
	  (lambda ()
	    (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
	      (ggtags-mode 1))))

(provide 'rc-c)
;;;
