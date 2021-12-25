;;; rc-file-management.el ---
(use-package treemacs
  :ensure t
  :defer t
  :bind
  (:map global-map
	("M-0" . treemacs-select-window)
	("C-x z" . treemacs)
	("C-x t C-n" . treemacs-next-project)
	("C-x t C-p" . treemacs-previous-project)))


(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(provide 'rc-file-management)
;;; 

