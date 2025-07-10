;;; rc-basic ---
(tool-bar-mode -1)
(menu-bar-mode -1)

(setq-default inhibit-startup-message t)

(add-to-list 'default-frame-alist
	     '(fullscreen . maximized))

(when window-system
    (set-frame-font (font-spec :family "Noto Sans Mono" :size 12))
    (dolist (script '(han cjk-misc bopomofo))
        (set-fontset-font
            (frame-parameter nil 'font)
            script
            (font-spec :name "Noto Sans CJK SC" :size 12))))

(setq-default line-spacing 4)

(defun el-tmpl (name)
  "init a rc-`name`.el"
  (interactive "stmpl name: ")
  (setq tmpl-name (downcase name))
  (insert (format ";;; rc-%s ---\n" name))
  (setq provide-stat (format "\n(provide 'rc-%s)\n" name))
  (insert provide-stat)
  (insert ";;;")
  (backward-char (+ (length provide-stat) 3)))

(provide 'rc-basic)
;;;
