(setq swank-clojure-classpath '("~//.emacs.d/jaskirat/swank-clojure-jars/clojure.jar" "~//.emacs.d/jaskirat/swank-clojure-jars/cloure-contrib.jar" "~//.emacs.d/jaskirat/swank-clojure-jars/swank-clojure.jar"))
(desktop-save-mode 1)

;; Org-mode yeah!
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
;; Turn on font lock for org-mode buffers only
(add-hook 'org-mode-hook 'turn-on-font-lock)  
