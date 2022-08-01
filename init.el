;; init use-package
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path (concat (file-name-directory user-init-file) "use-package"))
  (require 'use-package))

;; melpa
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; load config
(add-to-list 'load-path "~/.emacs.d/rc")
(require 'basic)
(require 'rc-org)
(require 'rc-file-management)

;; (setq custom-file "~/.emacs.d/custom.el")
;; (load custom-file)
