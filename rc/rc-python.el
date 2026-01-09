;;; rc-python.el --- Python development configuration
;;
;; Keybindings:
;;   M-.          - Go to definition (forward navigation)
;;   M-,          - Go back (backward navigation)
;;   C-c M-.      - Find all references to symbol at point
;;   C-c C-f      - Toggle code folding at point
;;   C-c C-s      - Show all folded code
;;   C-c C-h      - Hide all foldable code
;;   C-c p s      - Search (grep) in project
;;   C-c p f      - Find file in project
;;   C-c p r      - Replace in project
;;   C-c s        - Search with ripgrep (if installed)
;;
;; Dependencies to install:
;; 1. LSP server (choose one):
;;    - pylsp: pip install python-lsp-server[all]
;;    - pyright: npm install -g pyright
;; 2. Flycheck checkers (choose one or both):
;;    - flake8: pip install flake8
;;    - pylint: pip install pylint
;; 3. For ripgrep (optional, faster search):
;;    - macOS: brew install ripgrep
;;    - Linux: apt-get install ripgrep or yum install ripgrep

(require 'use-package)

;; Python mode
(use-package python
  :ensure t
  :mode (("\\.py\\'" . python-mode))
  :config
  (setq python-indent-offset 4)
  (setq python-indent-guess-indent-offset t)
  ;; Code navigation: M-. (forward) and M-, (backward)
  ;; xref is built-in and works with LSP
  :bind
  (:map python-mode-map
        ("M-." . xref-find-definitions)
        ("M-," . xref-pop-marker-stack)
        ("C-c M-." . xref-find-references)))

;; LSP for Python (pylsp or pyright)
;; Note: lsp-mode is already configured in rc-lsp.el
(use-package lsp-mode
  :ensure t
  :after python
  :hook (python-mode . lsp)
  :config
  ;; Configure LSP server (pylsp is recommended)
  ;; Install: pip install python-lsp-server[all]
  (setq lsp-pylsp-server-command '("pylsp"))
  ;; Alternative: pyright
  ;; Install: npm install -g pyright
  ;; (setq lsp-python-ms-executable "pyright-langserver")
  )

;; Code folding using hideshow (built-in)
(use-package hideshow
  :ensure t
  :hook (python-mode . hs-minor-mode)
  :bind
  (:map python-mode-map
        ("C-c C-f" . hs-toggle-hiding)
        ("C-c C-s" . hs-show-all)
        ("C-c C-h" . hs-hide-all)))

;; Alternative: origami for more advanced folding
;; (use-package origami
;;   :ensure t
;;   :hook (python-mode . origami-mode)
;;   :bind
;;   (:map python-mode-map
;;         ("C-c C-f" . origami-toggle-node)
;;         ("C-c C-s" . origami-open-all-nodes)
;;         ("C-c C-h" . origami-close-all-nodes)))

;; Flycheck for syntax checking
;; Install: pip install flake8 (or pylint)
(use-package flycheck
  :ensure t
  :hook (python-mode . flycheck-mode)
  :config
  ;; Use flake8 as checker (install: pip install flake8)
  (setq flycheck-python-flake8-executable "flake8")
  ;; Alternative: use pylint (install: pip install pylint)
  ;; (setq flycheck-python-pylint-executable "pylint")
  ;; (setq flycheck-python-pylint-use-symbolic-id nil)
  )

;; Project-wide search using projectile
;; Projectile is already referenced in rc-file-management.el
(use-package projectile
  :ensure t
  :after python
  :config
  (projectile-mode +1)
  :bind
  (:map python-mode-map
        ("C-c p s" . projectile-grep)
        ("C-c p f" . projectile-find-file)
        ("C-c p r" . projectile-replace)))

;; Alternative: ripgrep for faster search
;; Install: brew install ripgrep (macOS) or apt-get install ripgrep (Linux)
(use-package ripgrep
  :ensure t
  :after python
  :bind
  (:map python-mode-map
        ("C-c s" . ripgrep-regexp)))

;; Company for auto-completion (already installed, but configure for Python)
(use-package company
  :ensure t
  :after python
  :hook (python-mode . company-mode)
  :config
  (setq company-backends
        (add-to-list 'company-backends 'company-capf)))

;; Python-specific utilities
(use-package pyvenv
  :ensure t
  :after python
  :hook (python-mode . pyvenv-mode)
  :config
  (setq pyvenv-mode-line-indicator '(pyvenv-virtual-env-name (" [venv:" pyvenv-virtual-env-name "] "))))

(provide 'rc-python)
;;;

