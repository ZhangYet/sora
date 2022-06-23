;;; rc-lsp
(require 'use-package)
;; dependency
(use-package posframe
  :ensure t)

(use-package markdown-mode
  :ensure t)

(use-package yasnippet
  :ensure t)

(add-to-list 'load-path "~/.emacs.d/lsp-bridge")
(require 'yasnippet)
(yas-global-mode 1)

(require 'lsp-bridge)
(global-lsp-bridge-mode)

(provide 'rc-lsp)
;;;
