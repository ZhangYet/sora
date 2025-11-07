;;; rc-wc ---
;; 定义变量保存中文字符数
(defvar-local my/chinese-char-count 0
  "当前 buffer 的中文字符数。")

(defun my/update-chinese-char-count ()
  "统计 buffer 的中文字符数，并刷新 mode-line。"
  (setq my/chinese-char-count
        (save-excursion
          (goto-char (point-min))
          (let ((count 0))
            (while (re-search-forward "\\cc" nil t)
              (setq count (1+ count)))
            count)))
  (force-mode-line-update))

;; 在 mode-line 增加一段
(defun my/add-chinese-counter-to-mode-line ()
  (setq mode-line-format
        (append mode-line-format
                '((:eval (format " 中:%d" my/chinese-char-count))))))

;; 钩子：文件打开时添加 mode-line，保存时刷新统计
(add-hook 'find-file-hook #'my/add-chinese-counter-to-mode-line)
(add-hook 'after-save-hook #'my/update-chinese-char-count)

(provide 'rc-wc)
;;;
