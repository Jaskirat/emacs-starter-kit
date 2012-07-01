(load ".passwords.el")

(setq erc-user-full-name "Jaskirat Singh"
      erc-email-userid "me@jaskirat.info")

;; Highlight when my nick is used
(setq erc-keywords '("jaskirat" "jassi"))


;; Beep when highlighted
(add-hook 'erc-text-matched-hook 'erc-beep-on-match)
(setq erc-beep-match-types '(current-nick keyword))

;; Avoid annoying server messages
(defun reset-erc-track-mode ()
  (interactive)
  (setq erc-modified-channels-alist nil)
  (erc-modified-channels-update))

;; Don't care about the following notices
(setq erc-hide-list '("MODE"))

;; Don't log the following messages
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT"))


;; Set up timestamp on each line on the left 
(setq erc-timestamp-only-if-changed-flag nil
      erc-timestamp-format "[%R-%m/%d] "
      erc-insert-timestamp-function 'erc-insert-timestamp-left)

;; Logging
(setq erc-log-insert-log-on-open nil
      erc-log-channels t
      erc-log-channels-directory "~/.erclogs/"
      erc-save-buffer-on-part t
      erc-hide-timestamps nil)

;; When exiting emacs, save all logs without confirmation
(defun erc-save-buffers-in-logs ()
  (interactive)
  (mapc (lambda(buf)
	  (save-excursion
	    (set-buffer buf)
	    (erc-save-buffer-in-logs)))
	(erc-buffer-filter (lambda() t))))

(defadvice save-buffers-kill-emacs
  (before save-logs-before-save-buffers-kill-emacs (&rest args) activate)
  'erc-save-buffers-in-logs)
 
(defadvice save-some-buffers
  (before save-logs-before-save-some-buffers (&rest args) activate)
  'erc-save-buffers-in-logs)
 
(setq erc-prompt-for-nickserv-password nil)

;; erc-after-connect hook to login into different irc servers 
(add-hook 'erc-after-connect
	  '(lambda (SERVER NICK)
	     (cond
	      ((string-match "freenode\\.net" SERVER)
	       (erc-message "PRIVMSG" (concat "NickServ identify jaskirat " erc-password)))

	      ;; oftc nickserv requires password first then username :|
	      ((string-match "oftc\\.net" SERVER)
	       (erc-message "PRIVMSG" (concat "NickServ identify " erc-password " jaskirat"))))))

;;  (setq erc-nickserv-passwords
;;         '((freenode   (("jaskirat" . erc-password)))
;;           (OFTC       (("jaskirat" . erc-password)))))

;;; Function to connect to the networks! Yay!
(defun irc-now! ()
(interactive)
  (when (y-or-n-p "IRC? ")
    (erc :server "irc.freenode.net" :port 6667 :nick "jaskirat" :full-name "Jaskirat Singh" :password erc-password)
    (erc :server "irc.oftc.net" :port 6667 :nick "jaskirat" :full-name "Jaskirat Singh" :password erc-password)
    ;; Autojoin the following channels now since some might
    ;; require identification before hand
    (setq erc-autojoin-channels-alist
          '(("freenode.net" "#clojure" "#emacs" "#python")
            ("oftc.net" "#hackers-india")))))

;;Customization variables
(custom-set-variables
 '(erc-enable-logging (quote erc-log-all-but-server-buffers))
 '(erc-modules (quote (autojoin button completion fill irccontrols log match menu netsplit noncommands readonly ring smiley stamp track)))
)


