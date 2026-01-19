;; Package archives
(require 'package)

;; GNU ELPA (official Emacs package archive)
(add-to-list 'package-archives
             '("gnu" . "https://elpa.gnu.org/packages/") t)

;; NonGNU ELPA (additional packages)
(add-to-list 'package-archives
             '("nongnu" . "https://elpa.nongnu.org/nongnu/") t)

;; MELPA (unstable, latest versions)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

;; MELPA Stable (stable versions)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; Set archive priorities (prefer stable over unstable)
(setq package-archive-priorities
      '(("gnu" . 10)
        ("nongnu" . 9)
        ("melpa-stable" . 8)
        ("melpa" . 5)))

(package-initialize)

;; Ensure use-package is installed (required for Emacs 30+)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Configure use-package
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)  ; Make :ensure t default

;; load config
(add-to-list 'load-path (expand-file-name "rc" user-emacs-directory))
(require 'basic)
(require 'rc-basic)
(require 'rc-c)
(require 'rc-org)
(require 'rc-file-management)
(require 'rc-lsp)
(require 'rc-mc)
(require 'rc-wc)
(require 'rc-python)

;; Set custom file and load it if it exists
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file t))
