;;; rc-tramp.el --- TRAMP remote editing helpers

(require 'use-package)

;; TRAMP settings for better remote performance
(setq tramp-default-method "ssh"
      tramp-verbose 1
      tramp-auto-save-directory (expand-file-name "tramp-autosave" user-emacs-directory))

;; Open bpftrace project on VM quickly
(defun bpftrace-open ()
  "Open bpftrace project root on the VM via TRAMP."
  (interactive)
  (find-file "/ssh:bpftrace-vm:/home/dante/bpftrace/"))

;; Tell lsp-mode to launch clangd remotely for TRAMP buffers
(setq lsp-auto-guess-root t)
(with-eval-after-load 'lsp-mode
  (setq lsp-clients-clangd-executable "clangd"))

(provide 'rc-tramp)
;;;
