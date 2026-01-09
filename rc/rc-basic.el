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

(defun blog-tmpl (path)
  "init a blog"
  (interactive "spath: ")
  (insert "#+HUGO_BASE_DIR: ../\n")
  (insert (format "#+HUGO_SECTION: %s/posts\n" path))
  (insert "#+hugo_auto_set_lastmod: t\n#+hugo_tags:\n")
  (insert "#+hugo_categories:\n#+hugo_draft: true\n")
  (insert "#+description:\n#+author: Dantezy\n#+date:\n")
  (insert "#+TITLE:\n")
  (backward-char 1))

(defun j-tmpl ()
  "init Socrates journal"
  (interactive)
  (setq q1 "   Q: 昨天最开心的事情是什么？\n   A: \n")
  (insert q1)
  (setq q2 "\n   Q: 昨天工作有什么进展吗？\n   A: \n")
  (insert q2)
  (setq q3 "\n   Q: 昨天计划做的事情没有什么进展吗？\n   A: \n")
  (insert q3)
  (setq bl (+ (length q3) (length q2) 1))
  (backward-char bl))

(defun p-tmpl ()
  "insert today's plan"
  (interactive)
  (setq q "** Today's plan\n*** ")
  (insert q))

(provide 'rc-basic)
;;;
