;;; rc-org.el ---
(require 'use-package)

(use-package org
  :ensure t
  :init
  (setq org-todo-keywords
	'((sequence "FLEETING" "ORGANIZING" "PERMANENT")
	  (sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "GIVEUP")))
  :bind (("C-c l" . 'org-store-link)
	 ("C-c a" . 'org-agenda)
	 ("C-c c" . 'org-capture)))

(require 'ox-md nil t)

(defun org-begin-template ()
  "Make a template at point."
  (interactive)
  (if (org-at-table-p)
      (call-interactively 'org-table-rotate-recalc-marks)
    (let* ((choices '(("s" . "SRC")
                      ("e" . "EXAMPLE")
                      ("q" . "QUOTE")
                      ("v" . "VERSE")
                      ("c" . "CENTER")
                      ("l" . "LaTeX")
                      ("h" . "HTML")
                      ("a" . "ASCII")))
           (key
            (key-description
             (vector
              (read-key
               (concat (propertize "Template type: " 'face 'minibuffer-prompt)
                       (mapconcat (lambda (choice)
                                    (concat (propertize (car choice) 'face 'font-lock-type-face)
                                            ": "
                                            (cdr choice)))
                                  choices
                                  ", ")))))))
      (let ((result (assoc key choices)))
        (when result
          (let ((choice (cdr result)))
            (cond
             ((region-active-p)
              (let ((start (region-beginning))
                    (end (region-end)))
                (goto-char end)
                (insert "#+END_" choice "\n")
                (goto-char start)
                (insert "#+BEGIN_" choice "\n")))
             (t
              (insert "#+BEGIN_" choice "\n")
              (save-excursion (insert "#+END_" choice))))))))))

;;bind to key
(define-key org-mode-map (kbd "M-i") 'org-begin-template)

;; dot
(org-babel-do-load-languages
 'org-babel-load-languages
 '((dot . t)))

(provide 'rc-org)
;;;
