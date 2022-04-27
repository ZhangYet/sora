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
(if (file-exists-p "/usr/bin/clangd-12")
    (require 'rc-c)
  (message "install clangd-12 to enable c lsp"))

(setq custom-file "~/.emacs.d/custom.el")
(if (file-exists-p custom-file)
    (load custom-file)
  (message "custom.el not exists"))

