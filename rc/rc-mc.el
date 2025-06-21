(require 'use-package)
(use-package multiple-cursors
  :ensure t
  :bind
  (("C-M-j" . mc/mark-all-dwim)
   ("C-M-c" . mc/edit-lines)))
(provide 'rc-mc)
