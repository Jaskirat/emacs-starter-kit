;;Kill backward one word easy
(global-set-key "\C-w" 'backward-kill-word)

;;Fix kill region
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;; Keybindings for org-mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)

(global-set-key "\C-x\C-b" 'buffer-menu)
