;;; rc-file-management.el --- File and project management

(require 'use-package)

;; Projectile - Project management (used by treemacs)
(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  ;; Use ripgrep if available (faster than default grep)
  ;; Projectile will automatically detect and use rg if installed
  (when (executable-find "rg")
    (setq projectile-grep-command "rg --color=never --files-with-matches"))
  :bind
  (:map global-map
        ("C-c p s" . projectile-grep)           ; Search keyword in project
        ("C-c p f" . projectile-find-file)      ; Find file in project
        ("C-c p r" . projectile-replace)        ; Replace in project
        ("C-c p p" . projectile-switch-project) ; Switch project
        ("C-c p d" . projectile-find-dir)))     ; Find directory in project

;; Treemacs - File tree explorer
(use-package treemacs
  :ensure t
  :defer t
  :bind
  (:map global-map
	("M-0" . treemacs-select-window)
	("C-x z" . treemacs)
	("C-x t C-n" . treemacs-next-project)
	("C-x t C-p" . treemacs-previous-project)
	("C-x t C-f" . treemacs-create-file)))

;; Treemacs integration with projectile
(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

;; Note: If ripgrep (rg) is installed, projectile will use it automatically
;; Install: brew install ripgrep (macOS) or apt-get install ripgrep (Linux)

(provide 'rc-file-management)
;;; 

