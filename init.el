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

;; load config
(add-to-list 'load-path "~/.emacs.d/rc")
(require 'basic)
(require 'rc-basic)
(require 'rc-c)
(require 'rc-org)
(require 'rc-file-management)
(require 'rc-lsp)
(require 'rc-mc)
(require 'rc-wc)
(require 'rc-python)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
