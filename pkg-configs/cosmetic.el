;; make sure ansi colour character escapes are honoured
(require 'ansi-color)
(ansi-color-for-comint-mode-on)

;; Cursor-type
;; Use a bar cursor when mark is active and a region exists.
(defun th-activate-mark-init ()
  (setq cursor-type 'bar))

(add-hook 'activate-mark-hook 'th-activate-mark-init)

(defun th-deactivate-mark-init ()
  (setq cursor-type 'box))

(add-hook 'deactivate-mark-hook 'th-deactivate-mark-init)
