; Auto pair
(electric-pair-mode t)

(require 'use-package)

;; magit
(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

;; theme
(use-package moe-theme
  :ensure t
  :load-path "themes"
  :init
  (setq moe-theme-highlight-buffer-id t)
  :config
  (load-theme 'moe-dark t))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq-default whitespace-style
              '(face spaces empty tabs newline trailing space-mark tab-mark newline-mark))
(add-hook 'prog-mode-hook #'whitespace-mode)
(electric-indent-mode -1)

;; Company for auto-completion (modern replacement for auto-complete)
(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-idle-delay 0.5
        company-minimum-prefix-length 2))


(set-language-environment "UTF-8")

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; ace-window
(use-package avy
  :ensure t
  :bind (("C-o" . 'avy-goto-char)
	 ("M-o" . 'avy-goto-char-timer)))

(setq column-number-mode t)
(setq visual-line-mode t)

;; show full file path
(setq-default mode-line-buffer-identification
              (list 'buffer-file-name
                    (propertized-buffer-identification "%12f")
                    (propertized-buffer-identification "%12b")))

;; keybind
(global-set-key (kbd "M-k") 'windmove-right)
(global-set-key (kbd "M-j") 'windmove-left)

;; nov for reading epub
;;(use-package nov
;; :after esxml
;; :straight (nov :type git :host nil :repo "https://depp.brause.cc/nov.el.git"))

(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
(setq nov-text-width 120)
;; xclip
(use-package xclip
  :ensure t)
(xclip-mode 1)

;; trim space (already handled by before-save-hook above, but keep for compatibility)

;; rss
(use-package elfeed
  :ensure t
  :bind (("C-x w" . 'elfeed)))

(global-display-line-numbers-mode t)

(provide 'basic)
