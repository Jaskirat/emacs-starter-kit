;;Open recently closed files similar to Ctrl-Shift-T functionality
;;available in modern browsers.
;;Stolen and adapted from http://stackoverflow.com/a/2227692/42368

;;List to track closed files
(defvar closed-files (list))

;;Function to add most recently closed file to closed-files
(defun track-closed-file ()
  (and  buffer-file-name
        (message buffer-file-name)
        (or (delete buffer-file-name closed-files) t)
        (add-to-list 'closed-files buffer-file-name)))

;;Add tracker function to kill-buffer-hook
(add-hook 'kill-buffer-hook 'track-closed-file)


(defun recently-closed-files ()
  (interactive)
  (find-file (ido-completing-read "Recently Closed->" closed-files)))

(defun open-recently-closed-file ()
  (interactive)
  (let ((recent (pop closed-files)))
        (if  recent
            (and (message recent) (find-file recent))
          (message "No files were closed recently!"))))

;;Keybinding to display recently closed files
(global-set-key (kbd "C-S-y") 'recently-closed-files)

;;Keybinding to open most recently closed file
(global-set-key (kbd "C-S-t") 'open-recently-closed-file)

