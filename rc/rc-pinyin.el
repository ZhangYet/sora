;;; rc-pinyin ---
(require 'use-package)

(use-package pyim
  :ensure t
  :pin melpa)

(use-package pyim-basedict
  :ensure t
  :pin melpa)

(pyim-basedict-enable)


(provide 'rc-pinyin)
;;;
