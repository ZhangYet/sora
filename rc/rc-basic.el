;;; rc-basic ---
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-startup-message t)

(add-to-list 'default-frame-alist
	     '(fullscreen . maximized))

(when window-system
    (set-frame-font (font-spec :family "Noto Sans Mono" :size 12))
    (dolist (script '(han cjk-misc bopomofo))
        (set-fontset-font
            (frame-parameter nil 'font)
            script
            (font-spec :name "Noto Sans CJK SC" :size 12))))

(setq-default line-spacing 2)

(provide 'rc-basic)
;;;
