;; linum and auto pair
(global-linum-mode t)
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

;; autocomplete
;; auto complete
(use-package auto-complete
  :ensure t)
(setq ac-ignore-case nil)
(add-hook 'emacs-lisp-mode-hook (lambda ()
				  (auto-complete-mode t)
				  (setq ac-sources (append ac-sources '(ac-source-functions)))))
(use-package company
  :ensure t
  :init (add-hook 'after-init-hook 'global-company-mode))
(ac-config-default)


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
(use-package nov
 :after esxml
 :straight (nov :type git :host nil :repo "https://depp.brause.cc/nov.el.git"))
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

;; trim space
(add-hook 'write-file-hooks 'delete-trailing-whitespace nil t)
(provide 'basic)
