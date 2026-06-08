;;; rc-delimiters.el --- Delimiter / parentheses visualization

(require 'use-package)

;; Highlight matching paren when cursor is on one
(show-paren-mode 1)
(setq show-paren-style 'expression    ; 高亮整个表达式，而非仅括号
      show-paren-delay 0             ; 无延迟
      show-paren-when-point-inside-paren t
      show-paren-when-point-in-periphery t)

;; Rainbow delimiters — color-code nested parens/braces/brackets by depth
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

;; Paredit — structured editing for Lisp
(use-package paredit
  :ensure t
  :hook ((emacs-lisp-mode . paredit-mode)
         (lisp-mode . paredit-mode)
         (scheme-mode . paredit-mode))
  :config
  (setq paredit-use-hard-newlines nil))



;; Elisp formatting — indent whole buffer on save
(defun rc-format-elisp-buffer ()
  (indent-region (point-min) (point-max)))
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (add-hook 'before-save-hook #'rc-format-elisp-buffer nil t)))

(provide 'rc-delimiters)
;;;
