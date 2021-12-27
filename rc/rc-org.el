;;; rc-org.el ---
(require 'use-package)

(defvar todos
  '((sequence "FLEETING" "ORGANIZING" "|" "PERMANENT" "SKIP")
    (sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "GIVEUP")))

(defvar todo-index 0)
(defvar current-todo-keywords nil)

(defun switch-todo-keywords()
  (interactive)
  (setq todo-index (+ 1 todo-index))
  (setq current-todo-keywords
	(car (nthcdr (% todo-index 2) todos)))
  (message "current todo keywords %s" current-todo-keywords))

(switch-todo-keywords)

;; org itself
(use-package org
  :ensure t
  :init
  (setq org-todo-keywords
	'((sequence "FLEETING" "ORGANIZING" "|" "PERMANENT" "SKIP")
	  (sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "GIVEUP")))
  :bind (("C-c l" . 'org-store-link)
	 ("C-c a" . 'org-agenda)
	 ("C-c c" . 'org-capture)
	 ("C-c s" . 'switch-todo-keywords)))

(add-hook 'org-mode-hook 'turn-on-auto-fill)
(setq fill-column 120)


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

;; agenda
(defvar dynamic-agenda-files nil
  "dynamic generate agenda files list when changing org state")

(defun update-dynamic-agenda-hook ()
  (let ((done (or (not org-state) ;; nil when no TODO list
                  (member org-state org-done-keywords)))
        (file (buffer-file-name))
        (agenda (funcall (ad-get-orig-definition 'org-agenda-files)) ))
    (unless (member file agenda)
      (if done
          (save-excursion
            (goto-char (point-min))
            ;; Delete file from dynamic files when all TODO entry changed to DONE
            (unless (search-forward-regexp org-not-done-heading-regexp nil t)
              (customize-save-variable
               'dynamic-agenda-files
               (cl-delete-if (lambda (k) (string= k file))
                             dynamic-agenda-files))))
        ;; Add this file to dynamic agenda files
        (unless (member file dynamic-agenda-files)
          (customize-save-variable 'dynamic-agenda-files
                                   (add-to-list 'dynamic-agenda-files file)))))))

(defun dynamic-agenda-files-advice (orig-val)
  (cl-union orig-val dynamic-agenda-files :test #'equal))

(advice-add 'org-agenda-files :filter-return #'dynamic-agenda-files-advice)
(add-to-list 'org-after-todo-state-change-hook 'update-dynamic-agenda-hook t)

(defvar passenger-home
  (getenv "PASSENGER_HOME")
  "the location of passenger repo")

(if passenger-home
    (custom-set-variables '(org-agenda-files
			    (directory-files-recursively (symbol-value 'passenger-home) "\\.org$"))))


(provide 'rc-org)
;;;
