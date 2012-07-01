(require 'magit)

(eval-after-load "magit"
  (progn '(global-set-key (kbd "C-x g") 'magit-status)))
