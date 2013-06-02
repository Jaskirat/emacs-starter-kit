;;auto-complete mode
;;config stolen from github.com/ghoseb
;;(minus live pack related elisp and just works)
;;Thanks BG!
(require 'auto-complete)
(require 'auto-complete-config)

;;To make auto-complete work nicely with nrepl
(require 'ac-nrepl)

(ac-config-default)
(ac-flyspell-workaround)


(global-auto-complete-mode t)
(setq ac-auto-show-menu t)
(setq ac-dwim t)
(setq ac-use-menu-map t)
(setq ac-quick-help-delay 1)
(setq ac-quick-help-height 60)

(set-default 'ac-sources
             '(ac-source-dictionary
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-words-in-all-buffer))

;;nrepl sepecific hooks
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)

(dolist (mode '(magit-log-edit-mode
                log-edit-mode
                org-mode
                text-mode
                sass-mode
                yaml-mode
                csv-mode
                espresso-mode
                haskell-mode
                html-mode
                nxml-mode
                sh-mode
                clojure-mode
                lisp-mode
                textile-mode
                markdown-mode
                slime-repl-mode
                nrepl-mode))
  (add-to-list 'ac-modes mode))


;;ac-slime auto-complete plugin
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

;;Key triggers
(ac-set-trigger-key "TAB")
(define-key ac-completing-map (kbd "C-M-n") 'ac-next)
(define-key ac-completing-map (kbd "C-M-p") 'ac-previous)
(define-key ac-completing-map "\t" 'ac-complete)
(define-key ac-completing-map (kbd "M-RET") 'ac-help)
(define-key ac-completing-map "\r" 'nil)
